//
//  BetterRestView.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2022/01/11.
//

import SwiftUI

struct BetterRestView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    var body: some View {
        VStack {
            Text("When do you want to wake up?")
                .font(.headline)

            DatePicker("Please enter a time",
                       selection: $wakeUp,
                       displayedComponents: .hourAndMinute)
                .labelsHidden()

            Text("Desired amount of sleep")
                .font(.headline)

            Stepper("\(sleepAmount.formatted()) hours",
                    value: $sleepAmount,
                    in: 4...12,
                    step: 0.25)

            Text("Daily coffee intake")
                .font(.headline)

            Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups",
                    value: $coffeeAmount,
                    in: 1...20)
        }
        .navigationTitle(Project.betterRest.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Calculate", action: calculateBedtime)
        }
    }
}

fileprivate extension BetterRestView {
    func calculateBedtime() {
        // TODO: implement action
        print("did tap calculate button")
    }
}

struct BetterRestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BetterRestView()
        }
    }
}
