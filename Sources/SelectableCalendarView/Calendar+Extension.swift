//
//  Calendar+Extension.swift
//  SelectableCalendarView
//
//  Created by Shunzhe on 2022/04/19.
//

import Foundation

@available(iOS 10.0, *)
@available(macOS 10.12, *)
extension Calendar {
    
    func generateDates(inside interval: DateInterval, matching components: DateComponents) -> [Date] {
        var dates = [interval.start]
        enumerateDates(startingAfter: interval.start,
                       matching: components,
                       matchingPolicy: .nextTime
        ) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }
        return dates
    }
}
