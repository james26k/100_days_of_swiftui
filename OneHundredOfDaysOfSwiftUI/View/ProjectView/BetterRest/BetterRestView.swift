//
//  BetterRestView.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2022/01/11.
//

import SwiftUI

struct BetterRestView: View {
    @ObservedObject private var viewModel = BetterRestViewModel()

    var body: some View {
        Form {
            makeRow {
                Text("When do you want to wake up?")
                    .font(.headline)

                DatePicker("Please enter a time",
                           selection: $viewModel.wakeUp,
                           displayedComponents: .hourAndMinute)
                    .labelsHidden()
            }

            makeRow {
                Text("Desired amount of sleep")
                    .font(.headline)

                Stepper("\(viewModel.sleepAmount.formatted()) hours",
                        value: $viewModel.sleepAmount,
                        in: 4...12,
                        step: 0.25)
            }

            makeRow {
                Text("Daily coffee intake")
                    .font(.headline)

                Picker(viewModel.coffeeAmount == 1
                       ? "1 cup"
                       : "\(viewModel.coffeeAmount) cups", selection: $viewModel.coffeeAmount) {
                    ForEach(1..<21) {
                        Text("\($0)").tag($0)
                    }
                }
            }
        }
        .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
            Button("OK") {}
        } message: {
            Text(viewModel.alertMessage)
        }
        .navigationTitle(Project.betterRest.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Calculate", action: viewModel.calculateBedtime)
        }
    }
}

fileprivate extension BetterRestView {
    func makeRow<Row: View>(@ViewBuilder row: () -> Row) -> some View {
        Section {
            row()
        }
    }
}

struct BetterRestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BetterRestView()
        }
    }
}
