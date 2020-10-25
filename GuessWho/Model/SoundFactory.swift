//
//  SoundFactory.swift
//  FlashCardTest
//
//  Created by gary on 18/08/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation
import AVFoundation

struct SoundFactory {
    private enum SoundType {
        case correct(Girl)
        case incorrect(Girl, Girl)

        init(question: Question, girl: Girl) {
            if girl == question.girl {
                self = .correct(girl)
            } else {
                self = .incorrect(question.girl, girl)
            }
        }
    }

    private struct Filenames {
        struct caoimhe {
            static let correct = ["c_thats_me.wav", "c_yes.wav"]
            struct incorrect {
                static let no = ["c_no.wav"]
                static let notMe = ["c_thats_not_me.wav"]
                static let saoirse = ["c_thats_saoirse.wav"]
                static let morven = ["c_thats_morven.wav"]
            }
        }

        struct saoirse {
            static let correct = ["s_thats_me.wav", "s_yes.wav"]
            struct incorrect {
                static let no = ["s_no.wav"]
                static let notMe = ["s_thats_not_me.wav"]
                static let caoimhe = ["s_thats_caoimhe.wav"]
                static let morven = ["s_thats_morven.wav"]
            }
        }

        struct morven {
            static let correct = ["m_thats_me.wav", "m_yes.wav"]
            struct incorrect {
                static let no = ["m_no.wav"]
                static let notMe = ["m_thats_not_me.wav"]
                static let caoimhe = ["m_thats_caoimhe.wav"]
                static let saoirse = ["m_thats_saoirse.wav"]
            }
        }
    }

    private var player: AVAudioPlayer?

    private let bell = "Good-idea-bell.mp3"
}


// MARK: - Public API

extension SoundFactory {
    mutating func play(question: Question, girl: Girl) {
        let soundType = SoundType(question: question, girl: girl)
        let url = getUrl(for: soundType)
        if let player = try? AVAudioPlayer(contentsOf: url) {
            self.player = player
            player.play()
        }
    }
}


// MARK: - Private

private extension SoundFactory {
    private func getUrl(for type: SoundType) -> URL {
        switch type {
        case .correct(let girl):
            return getCorrectUrl(for: girl)
        case .incorrect(let questionGirl, let answerGirl):
            return getIncorrectUrl(questionGirl: questionGirl, answerGirl: answerGirl)
        }
    }


    private func getCorrectUrl(for girl: Girl) -> URL {
        let filenames = getCorrectFilenames(for: girl)
        return selectUrl(from: filenames)
    }


    private func getIncorrectUrl(questionGirl: Girl, answerGirl: Girl) -> URL {
        let filenames = getIncorrectFilenames(questionGirl: questionGirl, answerGirl: answerGirl)
        return selectUrl(from: filenames)
    }


    private func selectUrl(from filenames: [String]) -> URL {
        let filename = filenames.shuffled().first!
        let path = Bundle.main.path(forResource: filename, ofType: nil)!
        return URL(fileURLWithPath: path)
    }


    private func getCorrectFilenames(for girl: Girl) -> [String] {
        switch girl {
        case .caoimhe:
            return Filenames.caoimhe.correct
        case .saoirse:
            return Filenames.saoirse.correct
        case .morven:
            return Filenames.morven.correct
        }
    }


    private func getIncorrectFilenames(questionGirl: Girl, answerGirl: Girl) -> [String] {
        switch (questionGirl, answerGirl) {
        case (.caoimhe, .saoirse):
            return Filenames.saoirse.incorrect.caoimhe + Filenames.caoimhe.incorrect.no + Filenames.saoirse.incorrect.notMe
        case (.caoimhe, .morven):
            return Filenames.morven.incorrect.caoimhe + Filenames.caoimhe.incorrect.no + Filenames.morven.incorrect.notMe
        case (.saoirse, .caoimhe):
            return Filenames.caoimhe.incorrect.saoirse + Filenames.saoirse.incorrect.no + Filenames.caoimhe.incorrect.notMe
        case (.saoirse, .morven):
            return Filenames.morven.incorrect.saoirse + Filenames.saoirse.incorrect.no + Filenames.morven.incorrect.notMe
        case (.morven, .caoimhe):
            return Filenames.caoimhe.incorrect.morven + Filenames.morven.incorrect.no + Filenames.caoimhe.incorrect.notMe
        case (.morven, .saoirse):
            return Filenames.saoirse.incorrect.morven + Filenames.morven.incorrect.no + Filenames.saoirse.incorrect.notMe
        default:
            fatalError("Not an incorrect answer \(questionGirl), \(answerGirl)")
        }
    }
}
