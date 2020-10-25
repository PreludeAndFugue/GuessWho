//
//  Coordinator.swift
//  GuessWho
//
//  Created by gary on 24/10/2020.
//

import SwiftUI

final class Coordinator: ObservableObject {
    enum State {
        case start
        case playing
        case end
    }

    private var services: Services

    @Published var state: State = .start
    @Published var currentQuestionNumber = 1
    var game: Game!


    init(services: Services) {
        self.services = services
    }


    var questions: [Question] {
        return game.questions
    }


    var score: Int {
        game.score
    }


    var feedback: String {
        game.feedback
    }


    func start() {
        game = services.gameFactory.newGame()
        withAnimation {
            state = .playing
        }
    }

    
    func select(girl: Girl, question: Question) {
        game.answerQuestion(with: girl)
        services.soundFactory.play(question: question, girl: girl)
    }


    func nextQuestion() {
        if game.isDone {
            withAnimation {
                state = .end
            }
        } else {
            withAnimation {
                currentQuestionNumber += 1
            }
        }
    }


    func home() {
        state = .start
        currentQuestionNumber = 1
    }
}
