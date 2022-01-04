//
//  ProjectList.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2021/12/16.
//

import SwiftUI

enum Project: CaseIterable {
    case weSplit
    case guessTheFlag
    case viewsAndModifiers

    var name: String {
        switch self {
        case .weSplit:           return "We Split"
        case .guessTheFlag:      return "Guess the flag"
        case .viewsAndModifiers: return "Views and Modifiers"
        }
    }

    var view: some View {
        // NOTE: Opaque Result Typeに対応するためGroupでラップしている
        Group {
            switch self {
            case .weSplit:           WeSplitView()
            case .guessTheFlag:      GuessTheFlagView()
            case .viewsAndModifiers: ViewsAndModifiersView()
            }
        }
    }
}
