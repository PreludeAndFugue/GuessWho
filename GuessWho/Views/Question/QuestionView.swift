//
//  QuestionView.swift
//  GuessWho
//
//  Created by gary on 23/10/2020.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var coordinator: Coordinator
    let question: Question
    @State var isAnswered = false


    init(question: Question) {
        print("question view init", question.number)
        self.question = question
    }


    var body: some View {
        ZStack {
            Color.appBackground

            VStack {
                Text("Question \(question.number)")
                    .foregroundColor(.appText)
                    .font(.appFont(size: 30))

                PhotoAnswerView(
                    viewModel: .init(question: question),
                    isAnswered: $isAnswered
                )

                Text("Who is this?")
                    .foregroundColor(.appText)
                    .font(.appFont(size: 30))

                ForEach(question.answers) { girl in
                    QuestionAnswerView(
                        girl: girl,
                        isAnswered: $isAnswered,
                        action: select(girl:)
                    )
                }
            }
        }
        .ignoresSafeArea()
    }


    func select(girl: Girl) {
        coordinator.select(girl: girl, question: question)
        isAnswered = true
        print("select girl", girl)
    }
}


// MARK: - Preview

#if DEBUG
struct QuestionView_Previews: PreviewProvider {
    static let question = Question(
        number: 1,
        answers: [.caoimhe, .saoirse, .morven],
        photo: .init(path: "c14", girl: .caoimhe)
    )

    static var previews: some View {
        QuestionView(question: question)
    }
}
#endif
