param(
    [datetime]$StartDate = '2026-09-24',
    [datetime]$TargetDate = '2026-12-20'
)
$ErrorActionPreference = 'Stop'
$StartDate = $StartDate.Date
$TargetDate = $TargetDate.Date
if ($StartDate -gt $TargetDate) { throw 'StartDate must not be after TargetDate.' }
$utf8 = [System.Text.UTF8Encoding]::new($false)
function Fold-Line([string]$Line) {
    $part = ''
    foreach ($character in $Line.ToCharArray()) {
        if ($utf8.GetByteCount($part + $character) -gt 75) {
            $part
            $part = ' '
        }
        $part += $character
    }
    $part
}
$stamp = [datetime]::UtcNow.ToString("yyyyMMdd'T'HHmmss'Z'")
$lines = [System.Collections.Generic.List[string]]::new()
@('BEGIN:VCALENDAR','VERSION:2.0','PRODID:-//Kaoyan Countdown//CN','CALSCALE:GREGORIAN','METHOD:PUBLISH','X-WR-CALNAME:考研倒计时','X-WR-TIMEZONE:Asia/Shanghai','X-WR-CALDESC:按用户指定日期 2026-12-20 倒计时；官方初试日期为 2026-12-19 至 20。') | ForEach-Object { $lines.Add($_) }
for ($day = $StartDate; $day -le $TargetDate; $day = $day.AddDays(1)) {
    $remaining = ($TargetDate - $day).Days
    $summary = "${remaining}天"
    @(
        'BEGIN:VEVENT',
        "UID:kaoyan-$($day.ToString('yyyyMMdd'))@kaoyan-countdown",
        "DTSTAMP:$stamp",
        "LAST-MODIFIED:$stamp",
        'SEQUENCE:1',
        "DTSTART;VALUE=DATE:$($day.ToString('yyyyMMdd'))",
        "DTEND;VALUE=DATE:$($day.AddDays(1).ToString('yyyyMMdd'))",
        "SUMMARY:$summary",
        "DESCRIPTION:距离指定目标日 $($TargetDate.ToString('yyyy-MM-dd')) 还有 $remaining 天。\n2027 年硕士研究生招生初试为 2026-12-19 至 20；本日历以用户指定的 12 月 20 日为终点。\n具体考试安排以准考证为准。",
        'TRANSP:TRANSPARENT',
        'STATUS:CONFIRMED',
        'END:VEVENT'
    ) | ForEach-Object { $lines.Add($_) }
}
$lines.Add('END:VCALENDAR')
$folded = @($lines | ForEach-Object { Fold-Line $_ })
$outputPath = Join-Path $PSScriptRoot 'kaoyan-countdown.ics'
[System.IO.File]::WriteAllText($outputPath, ($folded -join "`r`n") + "`r`n", $utf8)
Write-Output "Generated $outputPath with $(($TargetDate - $StartDate).Days + 1) events."
