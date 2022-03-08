//
//  BetterRestViewModel.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2022/02/17.
//

import Combine
import CoreML
import Foundation

final class BetterRestViewModel: ObservableObject {
    @Published var wakeUp = defaultWakeUpTime
    @Published var sleepAmount = 8.0
    @Published var coffeeAmount = 1

    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var showingAlert = false
    @Published var betterRestTime = defaultWakeUpTime

    private var cancellables = Set<AnyCancellable>()

    private static var defaultWakeUpTime: Date {
        var dateComponents = DateComponents()
        dateComponents.hour = 7
        dateComponents.minute = 0
        return Calendar.current.date(from: dateComponents) ?? Date.now
    }

    init() {
        Publishers.CombineLatest3($wakeUp,
                                  $sleepAmount,
                                  $coffeeAmount)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] _ in
                self?.calculateBedtime()
            })
            .store(in: &cancellables)
    }

    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try BetterRest(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute),
                                                  estimatedSleep: sleepAmount,
                                                  coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep

//            alertTitle = "Your ideal bedtime is…"
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            betterRestTime = sleepTime
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            showingAlert = true
        }
//        showingAlert = true
    }
}
