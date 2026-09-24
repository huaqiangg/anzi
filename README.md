# 考研倒计时 · Apple 日历订阅

每天一条全天事件：从 2026 年 9 月 24 日的「87天」，到 2026 年 12 月 20 日的「0天」，共 88 条。事件不占用忙碌时间，不设闹铃。

目标日按用户要求设为 **2026 年 12 月 20 日**。[教育部公布的 2027 年全国硕士研究生招生初试日期](https://www.moe.gov.cn/jyb_xwfb/gzdt_gzdt/s5987/202609/t20260924_1451846.html)为 **2026 年 12 月 19—20 日**；目标日是初试第二天，请以准考证安排为准。

## 订阅方法

[点击订阅 Apple 日历](webcal://raw.githubusercontent.com/huaqiangg/anzi/main/kaoyan-countdown.ics)

如无法直接唤起日历，请复制以下地址到“添加订阅日历”：

```text
https://raw.githubusercontent.com/huaqiangg/anzi/main/kaoyan-countdown.ics
```

- iPhone / iPad：日历 → 日历 → 添加日历 → 添加订阅日历，粘贴链接并完成添加。
- Mac：日历 → 文件 → 新建日历订阅，粘贴链接并订阅。
- 选择 iCloud 账户可在使用同一 Apple 账户的设备间查看订阅。[Apple 官方说明](https://support.apple.com/zh-cn/102301)。

订阅后每天会显示对应日期的倒计时，无需每天更新文件。以后修改同一地址的日历文件，客户端刷新订阅后会获取更新；刷新时间由客户端决定。下载 `.ics` 后导入属于一次性导入，不会同步后续修改，请避免同时导入和订阅造成重复。

## 重新生成

使用 PowerShell 运行：

```powershell
./generate.ps1
```

生成 UTF-8、CRLF 换行的 iCalendar 文件，按 75 字节折行；全天事件使用 DATE 值和不包含在事件内的结束日期。事件 UID 按日历日期保持稳定。

## 详细复习计划订阅

已发布2026年9月28日至12月18日的详细复习日历，共219个事件。包括数二每周两套及当天批改、英二、政治、897遥感与GIS教材任务、周六补缺及周日休息；具体任务在事件详情中。

[订阅详细复习计划](webcal://raw.githubusercontent.com/huaqiangg/anzi/main/study-plan.ics)

也可以复制以下地址到 Apple 日历的“添加订阅日历”：

```text
https://raw.githubusercontent.com/huaqiangg/anzi/main/study-plan.ics
```

复习计划和数字倒计时为两个独立日历，可分别订阅。如果以前已将学习计划导入独立日历，请移除旧的学习计划日历后再订阅，避免重复。未来更新同一订阅地址，客户端刷新后即可获取。
