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

    var name: String {
        switch self {
        case .weSplit:      return "We Split"
        case .guessTheFlag: return "Guess the flag"
        }
    }

    var view: some View {
        switch self {
        case .weSplit: return WeSplitView()
        case .guessTheFlag: fatalError("Unimplemented")
        }
    }
}
