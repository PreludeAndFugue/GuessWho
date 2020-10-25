//
//  QuestionView.swift
//  GuessWho
//
//  Created by gary on 23/10/2020.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var coordinator: Coordinator
    @State var isAnswered = false
    @State private var showNextQuestion = false

    let question: Question


    var body: some View {
        ZStack {
            NavigationLink(
                destination: nextQuestion(),
                isActive: $showNextQuestion
            ) {
                EmptyView()
            }

            Color.appBackground

            VStack {
                Text("Question \(question.number)")
                    .foregroundColor(.appText)
                    .font(.appFont(size: 30))

                PhotoAnswerView(
                    viewModel: .init(question: question),
                    isAnswered: $isAnswered,
                    showNextQuestion: $showNextQuestion
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
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }


    func select(girl: Girl) {
        coordinator.select(girl: girl, question: question)
        isAnswered = true
    }


    func nextQuestion() -> some View {
        if let question = coordinator.nextQuestion() {
            return AnyView(QuestionView(question: question))
        } else {
            return AnyView(EmptyView())
        }
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
