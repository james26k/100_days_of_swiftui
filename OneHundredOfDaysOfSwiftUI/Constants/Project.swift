//
//  ProjectList.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2021/12/16.
//

import Foundation

enum Project: CaseIterable {
    case weSplit

    var name: String {
        switch self {
        case .weSplit: return "We Split"
        }
    }
}
