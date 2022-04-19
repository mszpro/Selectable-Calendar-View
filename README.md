# Selectable Calendar View

A SwiftUI calendar view that allows month switching and date picking.

You can simply add this repository to your project using Swift Package, `import SelectableCalendarView` into your SwiftUI view code, and then use the following code to show a calendar:

```swift
struct ContentView: View {
    
    @State private var dateSelected: Date = Date()
    
    var body: some View {
        if let targetMonth = Calendar.current.date(byAdding: .month, value: 0, to: Date()) {
                CalendarView(monthToDisplay: targetMonth, dateSelected: $dateSelected)
            }
    }
    
}
```

You can also customize the colors of the calendar view, or to show/hide the month switching buttons by adjusting the .init parameters:

```swift
public struct CalendarView: View {
    public init(monthToDisplay: Date, dateSelected: Binding<Date>, allowSwitchMonth: Bool = true, showMonthLabel: Bool = true) { ... }
}
```
