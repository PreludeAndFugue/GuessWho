//
//  Game.swift
//  FlashCardTest
//
//  Created by gary on 16/08/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation

final class Game {
    enum State {
        case question(Int)
        case done
    }

    let questions: [Question]
    private var state: State = .question(0)

    init(questions: [Question]) {
        self.questions = questions
    }
}


extension Game {
    var score: Int {
        var total = 0
        for question in questions {
            switch question.state {
            case .answered(let isCorrect):
                if isCorrect { total += 1}
            default:
                continue
            }
        }
        return total
    }


    var feedback: String {
        switch score {
        case 0...1:
            return "You've never met these girls before, have you?"
        case 2...3:
            return "Not very good. Were you guessing?"
        case 4:
            return "Not bad...not good!"
        case 5:
            return "So so"
        case 6:
            return "You're on the right track"
        case 7:
            return "Good...but you can probably do better"
        case 8:
            return "Very good"
        case 9:
            return "You must be a close relative!"
        case 10:
            return "Are you their parent?!"
        default:
            return ""
        }
    }


    var isDone: Bool {
        switch state {
        case .done:
            return true
        default:
            return false
        }
    }


    func answerQuestion(with girl: Girl) {
        switch state {
        case .question(let i):
            let question = questions[i]
            if question.isAnswered { return }
            question.answer(with: girl)
            updateState()
        case .done:
            return
        }
    }


    func nextQuestion() -> Question? {
        switch state {
        case .done:
            return nil
        case .question(let i):
            let next = i + 1
            print(next)
            if next < questions.endIndex {
                return questions[next]
            } else {
                return nil
            }
        }
    }
}


// MARK: - Private

private extension Game {
    func updateState() {
        switch state {
        case .question(let index):
            let newIndex = index + 1
            if newIndex < questions.endIndex {
                state = .question(newIndex)
            } else {
                state = .done
            }
        case .done:
            break
        }
    }
}
