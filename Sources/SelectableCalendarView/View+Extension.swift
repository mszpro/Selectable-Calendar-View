//
//  View+Extension.swift
//  SelectableCalendarView
//
//  Created by Shunzhe on 2022/04/19.
//

import Foundation
import SwiftUI

@available(iOS 15, *)
@available(macOS 12, *)
extension View {
    @ViewBuilder
    func addCircularBackground(isFilled: Bool, isSelected: Bool, highlightColor: Color = .blue, normalColor: Color = .cyan) -> some View {
        self
            .padding(9)
        #if os(macOS)
            .foregroundColor(Color(cgColor: .black))
        #elseif os(iOS)
            .foregroundColor(Color(uiColor: .systemBackground))
        #endif
            .background(
                Circle()
                    .foregroundColor(isSelected ? highlightColor : normalColor)
                    .frame(width: 35, height: 35)
                    .opacity(isFilled ? 1.0 : 0.5)
                    .padding(isSelected ? 3 : 0)
                    .overlay(
                        Circle()
                            .stroke(highlightColor, lineWidth: isSelected ? 2 : 0)
                    )
            )
    }
}
