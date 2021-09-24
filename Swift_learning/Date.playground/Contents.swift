import Foundation

// Dateのメモ

let now = Date()
let current = Calendar.current
let calender = Calendar(identifier: .gregorian)

let today = Calendar.current.startOfDay(for: now)

// 今の年
let nowYear = current.component(.year, from: now)

let date2 = calender.date(from: DateComponents(year: nowYear, month: 12, day: 31, hour: 23, minute: 59))

let endOfYear = calender.startOfDay(for: date2!)

// 今から年末までの日数
calender.dateComponents([.day], from: today, to: endOfYear)


// 今から年末までの日数プロパティ
let endOfYearDays: Int = {
    let calendar = Calendar(identifier: .gregorian)
    let today = calendar.startOfDay(for: Date())
    let nowYear = calendar.component(.year, from: today)
    let endDate = calendar.date(from: DateComponents(year: nowYear, month: 12, day: 31))
    let endOfYear = calendar.startOfDay(for: endDate!)
    let days = calendar.dateComponents([.day], from: today, to: endOfYear)
    let numberOfDays = days.day!
    return numberOfDays
}()

endOfYearDays


/*
 
 Android
 今
 private var startDate = Calendar.getInstance().getNowString()
 
 
 
 private fun getEndOfYearDays(startDate: String): Int {
     // 当日、12月31日共に含める
     val calendar = Calendar.getInstance()
     calendar.time = startDate.toDate(START_DATE_FORMAT)
     // 秒を算出
     val start = calendar.timeInMillis
 　  // その年の年末を取得
     calendar.set(calendar.get(Calendar.YEAR), 11, 31)
     val newYearsEve = calendar.timeInMillis
     var diff = newYearsEve - start
     diff /= 1000 // second
     diff /= 60 // minutes
     diff /= 60 // hour
     diff /= 24 // day
     return diff.toInt() + 1
 }
 
 */
