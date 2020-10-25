//
//  PhotoFactory.swift
//  FlashCardTest
//
//  Created by gary on 16/08/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation

struct PhotoFactory {
    private lazy var photos: [Photo] = self.makePhotos()


    mutating func randomPhotos(count: Int = 10) -> [Photo] {
        Array(photos.shuffled()[0..<count])
    }
}


// MARK: - Private

private extension PhotoFactory {
    private func makePhotos() -> [Photo] {
        var allPhotos: [Photo] = []
        allPhotos.append(contentsOf: caoimhePhotos)
        allPhotos.append(contentsOf: saoirsePhotos)
        allPhotos.append(contentsOf: morvenPhotos)
        return allPhotos
    }


    var caoimhePhotos: [Photo] {
        makePhotos(for: .caoimhe)
    }


    var saoirsePhotos: [Photo] {
        makePhotos(for: .saoirse)
    }


    var morvenPhotos: [Photo] {
        makePhotos(for: .morven)
    }


    func makePhotos(for girl: Girl) -> [Photo] {
        (1...girl.numberOfPhotos)
            .map({ Photo(path: String(format: "%@%02d", girl.initial, $0), girl: girl) })
    }
}
