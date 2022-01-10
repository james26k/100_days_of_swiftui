//
//  BrainTrainingGameView.swift
//  OneHundredOfDaysOfSwiftUI
//
//  Created by Kohei Hayashi on 2022/01/05.
//

import SwiftUI

private enum Move: String, CaseIterable {
    case rock     = "✊"
    case paper    = "✋"
    case scissors = "✌️"
}

struct BrainTrainingGameView: View {
    private let allMoves = Move.allCases
    @State private var appsMove = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()

    @State private var playersScore = 0
    @State private var matchCount = 0
    @State private var showingScoreAlert = false

    var body: some View {
        VStack(spacing: 50) {
            VStack(spacing: 20) {
                Text(allMoves[appsMove].rawValue)
                Text("You should \(shouldWin ? "win" : "lose")")
            }
            .font(.title)

            HStack(spacing: 50) {
                ForEach(allMoves, id: \.self) {
                    MoveButton(move: $0)
                }
            }
        }
        .navigationTitle(Project.brainTrainingGame.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
// MARK: - custom struct
private struct MoveButton: View {
    var move: Move
    var didTapButton: ((Move) -> Void)?

    var body: some View {
        Button {
            print("did tap \(move.rawValue)")
            didTapButton?(move)
        } label: {
            HStack {
                Text(move.rawValue)
                    .font(.system(size: 50))
            }
        }
        .buttonStyle(ScaleButtonStyle())
    }
}
// MARK: - custom button style
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
    }
}
// MARK: - preview
struct BrainTrainingGameView_Previews: PreviewProvider {
    static var previews: some View {
        BrainTrainingGameView()
    }
}
