//
//  QuestionContainerView.swift
//  GuessWho
//
//  Created by gary on 23/10/2020.
//

import SwiftUI

struct QuestionContainerView: View {
    let question: Question
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.appBackground

                QuestionView(question: question)
            }
        }
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
        QuestionContainerView(question: question1)
    }
}
#endif
