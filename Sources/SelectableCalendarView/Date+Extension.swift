//
//  Date+Extension.swift
//  SelectableCalendarView
//
//  Created by Shunzhe on 2022/04/19.
//

import Foundation

@available(iOS 10.0, *)
@available(macOS 10.12, *)
extension Date {
    
    func getDayNumber()->Int {
        return Calendar.current.component(.day, from: self)
    }
    
    func getMonthString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/MM"
        return formatter.string(from: self)
    }
    
    func getDaysForMonth() -> [Date] {
        guard
            let monthInterval = Calendar.current.dateInterval(of: .month, for: self),
            let monthFirstWeek = Calendar.current.dateInterval(of: .weekOfMonth, for: monthInterval.start),
            let monthLastWeek = Calendar.current.dateInterval(of: .weekOfMonth, for: monthInterval.end)
        else {
            return []
        }
        let resultDates = Calendar.current.generateDates(inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
                                                         matching: DateComponents(hour: 0, minute: 0, second: 0))
        return resultDates
    }
    
    func isSameDay(comparingTo: Date) -> Bool {
        let selfComponents = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let comparingComponents = Calendar.current.dateComponents([.year, .month, .day], from: comparingTo)
        guard let selfYear = selfComponents.year,
              let selfMonth = selfComponents.month,
              let selfDay = selfComponents.day,
              let comparingYear = comparingComponents.year,
              let comparingMonth = comparingComponents.month,
              let comparingDay = comparingComponents.day else {
            return false
        }
        return selfYear == comparingYear &&
               selfMonth == comparingMonth &&
               selfDay == comparingDay
    }
    
    func getLastMonth() -> Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: self) ?? self
    }
    
    func getNextMonth() -> Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: self) ?? self
    }
    
}
