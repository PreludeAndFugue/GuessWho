//
//  Services.swift
//  FlashCardTest
//
//  Created by gary on 16/08/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation

final class Services {
    lazy var photoFactory: PhotoFactory = { PhotoFactory() }()
    lazy var gameFactory: GameFactory = { GameFactory(photoFactory: photoFactory) }()
    lazy var soundFactory: SoundFactory = { SoundFactory() }()
}
