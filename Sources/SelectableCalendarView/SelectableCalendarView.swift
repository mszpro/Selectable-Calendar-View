//
//  CalendarView.swift
//  SelectableCalendarView
//
//  Created by Shunzhe on 2022/04/19.
//

import SwiftUI

@available(macOS 12, *)
@available(iOS 15, *)
public struct SelectableCalendarView: View {
    
    // 表示される月の任意の日に設定します（通常は1日）
    @State var monthToDisplay: Date
    
    // The date user selected
    @Binding var dateSelected: Date
    
    // If user can switch to previous month or next month
    var allowSwitchMonth: Bool
    
    // Whether to show the month label
    var showMonthLabel: Bool
    
    // Provide a function; this class will ask if a specific date circle should be filled in (a darker color).
    var isDateCircleFilled: ((Date) -> Bool)?
    
    public init(monthToDisplay: Date, dateSelected: Binding<Date>, allowSwitchMonth: Bool = true, showMonthLabel: Bool = true, isDateCircleFilled: ((Date) -> Bool)? = nil) {
        self._monthToDisplay = .init(initialValue: monthToDisplay)
        self._dateSelected = dateSelected
        self.allowSwitchMonth = allowSwitchMonth
        self.showMonthLabel = showMonthLabel
        self.isDateCircleFilled = isDateCircleFilled
    }
    
    public var body: some View {
        VStack {
            HStack {
                if allowSwitchMonth {
                    Button {
                        monthToDisplay = monthToDisplay.getLastMonth()
                    } label: {
                        Image(systemName: "arrow.left.circle")
                            .font(.system(size: 30))
                    }
                    if monthToDisplay.getMonthString() != Date().getMonthString() {
                        // Show the user return to current month button
                        Button {
                            monthToDisplay = Date()
                        } label: {
                            Image(systemName: "arrow.counterclockwise.circle")
                                .font(.system(size: 30))
                        }
                    }
                }
                Spacer()
                if showMonthLabel {
                    Text(monthToDisplay.getMonthString())
                        .font(.title2)
                }
                Spacer()
                if allowSwitchMonth {
                    Button {
                        monthToDisplay = monthToDisplay.getNextMonth()
                    } label: {
                        Image(systemName: "arrow.right.circle")
                            .font(.system(size: 30))
                    }
                }
            }
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                // Week day labels
                ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"], id: \.self) { weekdayName in
                    Text(weekdayName)
                }
                // Day number text
                Section {
                    ForEach(monthToDisplay.getDaysForMonth(), id: \.self) { date in
                        // Only display days of the given month
                        if Calendar.current.isDate(date, equalTo: monthToDisplay, toGranularity: .month) {
                            Button {
                                self.dateSelected = date
                            } label: {
                                if let isDateCircleFilled = isDateCircleFilled {
                                    Text("\(date.getDayNumber())")
                                        .id(date)
                                        .addCircularBackground(isFilled: isDateCircleFilled(date), isSelected: dateSelected.isSameDay(comparingTo: date))
                                } else {
                                    Text("\(date.getDayNumber())")
                                        .id(date)
                                        .addCircularBackground(isFilled: true, isSelected: dateSelected.isSameDay(comparingTo: date))
                                }
                            }
                        } else {
                            Text("\(date.getDayNumber())")
                                .addCircularBackground(isFilled: false, isSelected: false)
                                .hidden()
                        }
                    }
                }
            }
        }
    }
    
}
