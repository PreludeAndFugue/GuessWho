//
//  ResultsView.swift
//  GuessWho
//
//  Created by gary on 25/10/2020.
//

import SwiftUI

struct ResultsView: View {
    let questions: [Question]
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(questions) { question in
                    ResultView(question: question)
                }
            }
        }
        .padding()
        .background(Color.appBackground)
        .ignoresSafeArea()
    }
}


// MARK: - Preview

#if DEBUG
struct ResultsView_Previews: PreviewProvider {
    private static let questions: [Question] = [
        Question(
            number: 1,
            answers: [.morven, .caoimhe, .saoirse],
            photo: Photo(path: "m03", girl: .morven),
            state: .answered(correct: true)
        ),
        Question(
            number: 1,
            answers: [.morven, .caoimhe, .saoirse],
            photo: Photo(path: "m03", girl: .morven),
            state: .answered(correct: false)
        ),
        Question(
            number: 1,
            answers: [.morven, .caoimhe, .saoirse],
            photo: Photo(path: "m03", girl: .morven),
            state: .answered(correct: true)
        )
    ]

    static var previews: some View {
        ResultsView(questions: questions)
    }
}
#endif
