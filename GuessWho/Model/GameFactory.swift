//
//  GameFactory.swift
//  FlashCardTest
//
//  Created by gary on 16/08/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation

final class GameFactory: ObservableObject {
    var photoFactory: PhotoFactory


    init(photoFactory: PhotoFactory) {
        self.photoFactory = photoFactory
    }


    func newGame() -> Game {
        var questions: [Question] = []
        for (i, photo) in photoFactory.randomPhotos().enumerated() {
            questions.append(Question(number: i + 1, answers: Girl.allGirlsShuffled, photo: photo))
        }
        return Game(questions: questions)
    }
}
