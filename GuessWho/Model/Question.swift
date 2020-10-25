//
//  Question.swift
//  FlashCardTest
//
//  Created by gary on 16/08/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation

final class Question {

    enum State {
        case unanswered
        case answered(correct: Bool)
    }

    let number: Int
    let answers: [Girl]
    let photo: Photo
    var state: State

    init(number: Int, answers: [Girl], photo: Photo) {
        self.number = number
        self.answers = answers
        self.photo = photo
        self.state = .unanswered
    }
}


extension Question {
    var isAnswered: Bool {
        switch state {
        case .answered:
            return true
        default:
            return false
        }
    }


    var girl: Girl {
        return photo.girl
    }


    func isCorrectAnswer(girl: Girl) -> Bool {
        return girl == photo.girl
    }


    func answer(with girl: Girl) {
        let correct = girl == photo.girl
        state = .answered(correct: correct)
    }
}


// MARK: - Identifiable

extension Question: Identifiable {
    var id: Int {
        return number
    }
}


// MARK: - CustomDebugStringConvertible

extension Question: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Question(\(number), \(state))"
    }
}


// MARK: - Question.State CustomDebugStringConvertible

extension Question.State: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .unanswered:
            return "unanswered"
        case .answered(let correct):
            return "answered (\(correct))"
        }
    }
}
