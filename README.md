# Selectable Calendar View

A SwiftUI calendar view that allows month switching and date picking.

<img height="300" src="https://raw.githubusercontent.com/mszpro/Selectable-Calendar-View/main/Social-Image.png">

## Usage

You can simply add this repository to your project using Swift Package, `import SelectableCalendarView` into your SwiftUI view code, and then use the following code to show a calendar:

```swift
import SelectableCalendarView
struct ContentView: View {
    
    @State private var dateSelected: Date = Date()
    
    var body: some View {
        // monthToDisplay変数には、表示させたい月の任意の日を指定します。
        SelectableCalendarView(monthToDisplay: Date(), dateSelected: $dateSelected)
    }
    
}
```

You can also customize the colors of the calendar view, or to show/hide the month switching buttons by adjusting the .init parameters:

```swift
public struct SelectableCalendarView: View {
    public init(monthToDisplay: Date, dateSelected: Binding<Date>, allowSwitchMonth: Bool = true, showMonthLabel: Bool = true, isDateCircleFilled: ((Date) -> Bool)? = nil) { ... }
}
```

- `monthToDisplay` is any day of the month you want to display.
- `dateSelected` is the way your app reads/sets the date selected on the calendar view.
- `allowSwitchMonth` controls whether the previous/next/current month switching buttons are shown.
- `showMonthLabel` cnotrols whether the name of the month is shown or not.
- `isDateCircleFilled` is a delegate-style function you use to indicate whether a date circle should be highlighted.

## Install

Add a new Swift Package with the repository URL.

See [here](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app) to learn how to add a package to your project.

The URL of this repository is: https://github.com/mszpro/Selectable-Calendar-View
