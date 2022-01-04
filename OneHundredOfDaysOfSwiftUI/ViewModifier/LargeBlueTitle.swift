//
//  LargeBlueTitle.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2022/01/04.
//

import SwiftUI

struct LargeBlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeBlueTitleStyle() -> some View {
        modifier(LargeBlueTitle())
    }
}
