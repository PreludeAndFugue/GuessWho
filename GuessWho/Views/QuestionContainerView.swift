//
//  QuestionContainerView.swift
//  GuessWho
//
//  Created by gary on 23/10/2020.
//

import SwiftUI

struct QuestionContainerView: View {
    let questions: [Question]
    @Binding var selectedQuestion: Int
    
    var body: some View {
        TabView(selection: $selectedQuestion) {
            ForEach(questions) { question in
                QuestionView(question: question)
                    .tag(question.number)
            }
        }
        .background(Color.red)
        .ignoresSafeArea(.all, edges: .all)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}


// MARK: - Preview

#if DEBUG
struct QuestionContainerView_Previews: PreviewProvider {
    static let question1 = Question(
        number: 1,
        answers: [.caoimhe, .morven, .saoirse],
        photo: .init(path: "c03", girl: .caoimhe)
    )
    static let question2 = Question(
        number: 2,
        answers: [.caoimhe, .morven, .saoirse],
        photo: .init(path: "c04", girl: .caoimhe)
    )
    static let question3 = Question(
        number: 3,
        answers: [.caoimhe, .morven, .saoirse],
        photo: .init(path: "c05", girl: .caoimhe)
    )

    static var previews: some View {
        QuestionContainerView(
            questions: [question1, question2, question3],
            selectedQuestion: .constant(1)
        )
    }
}
#endif
