//
//  WeSplitView.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2021/12/17.
//

import SwiftUI

struct WeSplitView: View {
    private let tipPercentages = [10, 15, 20, 25, 0]
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20

    var body: some View {
        Form {
            let code = Locale.current.currencyCode ?? "USD"
            Section {
                TextField("Amount",
                          value: $checkAmount,
                          format: .currency(code: code))
                    .keyboardType(.decimalPad)
            }
            Section {
                Text(checkAmount, format: .currency(code: code))
            }
        }
    }
}

struct WeSplitView_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitView()
    }
}
