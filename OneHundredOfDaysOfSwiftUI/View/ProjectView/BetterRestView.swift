//
//  BetterRestView.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2022/01/11.
//

import SwiftUI

struct BetterRestView: View {
    @State private var sleepAmount = 8.0

    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours",
                value: $sleepAmount,
                in: 4...12,
                step: 0.25)
    }
}

struct BetterRestView_Previews: PreviewProvider {
    static var previews: some View {
        BetterRestView()
    }
}
