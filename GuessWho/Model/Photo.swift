//
//  Photo.swift
//  FlashCardTest
//
//  Created by gary on 16/08/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation
import SwiftUI

struct Photo {
    let path: String
    let girl: Girl

    var image: Image {
        return Image(path)
    }
}
