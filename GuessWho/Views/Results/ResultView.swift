//
//  ResultView.swift
//  GuessWho
//
//  Created by gary on 25/10/2020.
//

import SwiftUI

struct ResultView: View {
    let question: Question

    var body: some View {
        VStack {
            answerView
                .font(.appFont(size: 50))
                .shadow(color: .black, radius: 2, x: 0, y: 0)
                .padding()

            Spacer()

            Text(question.girl.name)
                .font(.appFont(size: 30))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 3, x: 0, y: 0)
        }
        .frame(width: 150, height: 120)
        .background(backgroundImage)
        .cornerRadius(12)
    }


    private var answerView: some View {
        switch question.state {
        case .answered(let correct):
            if correct {
                return Image(systemName: "checkmark")
                    .foregroundColor(.white)
            } else {
                return Image(systemName: "xmark")
                    .foregroundColor(.red)
            }
        case .unanswered:
            return Image(systemName: "questionmark")
                .foregroundColor(.white)
        }
    }


    private var backgroundImage: some View {
        question.photo.image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}


// MARK: - Preview

#if DEBUG
extension Question {
    convenience init(number: Int, answers: [Girl], photo: Photo, state: Question.State) {
        self.init(number: number, answers: answers, photo: photo)
        self.state = state
    }
}


struct ResultView_Previews: PreviewProvider {
    static let question1 = Question(
        number: 1,
        answers: [.morven, .caoimhe, .saoirse],
        photo: Photo(path: "m03", girl: .morven),
        state: .answered(correct: true)
    )
    static let question2 = Question(
        number: 1,
        answers: [.morven, .caoimhe, .saoirse],
        photo: Photo(path: "m03", girl: .caoimhe),
        state: .answered(correct: false)
    )
    static let question3 = Question(
        number: 1,
        answers: [.morven, .caoimhe, .saoirse],
        photo: Photo(path: "m03", girl: .caoimhe),
        state: .unanswered
    )

    static var previews: some View {
        Group {
            ResultView(question: question1)
            ResultView(question: question2)
            ResultView(question: question3)
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif
