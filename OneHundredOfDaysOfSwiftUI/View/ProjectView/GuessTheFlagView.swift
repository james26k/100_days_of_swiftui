//
//  GuessTheFlagView.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2021/12/27.
//

import SwiftUI

struct GuessTheFlagView: View {
    private var countries = [
        "estonia",
        "france",
        "germany",
        "ireland",
        "italy",
        "nigeria",
        "poland",
        "russia",
        "spain",
        "uk",
        "us"
    ].shuffled()
    private var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()

            VStack {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }

                ForEach(0..<3) { number in
                    Button {
                        print("did tap button")
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                }
            }

        }
    }
}

struct GuessTheFlagView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlagView()
    }
}
