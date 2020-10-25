//
//  PhotoAnswerViewModel.swift
//  GuessWho
//
//  Created by gary on 24/10/2020.
//

import SwiftUI

final class PhotoAnswerViewModel: ObservableObject {
    private let question: Question

    init(question: Question) {
        self.question = question
    }

    @Published var angle1 = 0.0
    @Published var angle2 = 180.0
    @Published var opacity = 1.0
    @Published var imageName = "checkmark"
    @Published var imageColour = Color.black


    var photo: Image {
        question.photo.image
    }

    var name: String {
        question.girl.name
    }


    func showAnswer() {
        switch question.state {
        case .answered(let correct):
            imageName = correct ? "checkmark" : "xmark"
            imageColour = correct ? .white : .red
        case .unanswered:
            break
        }
        withAnimation {
            angle1 += 180
            angle2 += 180
            opacity = opacity == 1 ? 0 : 1
        }
    }
}
