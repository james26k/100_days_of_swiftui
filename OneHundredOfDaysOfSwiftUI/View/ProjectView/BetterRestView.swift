//
//  BetterRestView.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2022/01/11.
//

import SwiftUI

struct BetterRestView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now

    var body: some View {
        VStack(spacing: 10) {
            Stepper("\(sleepAmount.formatted()) hours",
                    value: $sleepAmount,
                    in: 4...12,
                    step: 0.25)

            DatePicker("Please enter a date",
                       selection: $wakeUp,
                       in: Date.now...)
                .labelsHidden()
        }
        .padding(.horizontal)
    }
}

struct BetterRestView_Previews: PreviewProvider {
    static var previews: some View {
        BetterRestView()
    }
}
