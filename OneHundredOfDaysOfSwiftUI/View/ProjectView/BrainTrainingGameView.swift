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

    var isWinMove: Self {
        switch self {
        case .rock:     return .paper
        case .paper:    return .scissors
        case .scissors: return .rock
        }
    }

    var isLoseMove: Self {
        switch self {
        case .rock:     return .scissors
        case .paper:    return .rock
        case .scissors: return .paper
        }
    }
}

struct BrainTrainingGameView: View {
    private let allMoves = Move.allCases
    @State private var appsMove = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()

    @State private var playersScore = 0
    @State private var matchCount = 0 {
        didSet {
            // NOTE: 勝負判定は10回
            if matchCount == 10 {
                showingScoreAlert = true
            }
        }
    }
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
                    MoveButton(move: $0,
                               didTapButton: { move in
                        self.playersScore += judgeScore(playersMove: move)
                        self.matchCount += 1
                        self.updateQuestion()
                    })
                }
            }
        }
        .alert("You're score is \(playersScore)",
               isPresented: $showingScoreAlert) {
            Button("Reset", action: resetGame)
        } message: {
            if let review = getScoreReview(score: playersScore) {
                Text(review)
            } else {
                EmptyView()
            }
        }
        .navigationTitle(Project.brainTrainingGame.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func judgeScore(playersMove: Move) -> Int{
        let currentAppsMove = allMoves[appsMove]
        let correctMove = shouldWin
        ? currentAppsMove.isWinMove
        : currentAppsMove.isLoseMove
        return correctMove == playersMove ? 1 : -1
    }

    private func updateQuestion() {
        appsMove = Int.random(in: 0..<3)
        shouldWin.toggle()
    }

    private func resetGame() {
        playersScore = 0
        matchCount = 0
    }

    private func getScoreReview(score: Int) -> String? {
        let badScoreRange: Range<Int> = -10..<4
        let goodScoreRange: Range<Int> = 4..<8
        let greatScoreRange: Range<Int> = Range(8...10) // '...' はClosedRange Type
        switch score {
        case badScoreRange:   return "Bad score"
        case goodScoreRange:  return "Good score"
        case greatScoreRange: return "Great score"
        default:              return nil
        }
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
