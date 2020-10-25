//
//  Girl.swift
//  FlashCardTest
//
//  Created by gary on 16/08/2018.
//  Copyright © 2018 Gary Kerr. All rights reserved.
//

import Foundation

enum Girl: Int, CaseIterable {
    case caoimhe
    case saoirse
    case morven
}


// MARK: - Identifiable

extension Girl: Identifiable {
    var id: Int {
        return rawValue
    }
}


extension Girl {
    var name: String {
        switch self {
        case .caoimhe: return "Caoimhe"
        case .saoirse: return "Saoirse"
        case .morven: return "Morven"
        }
    }

    var initial: String {
        String(name[name.startIndex..<name.index(after: name.startIndex)]).lowercased()
    }

    var numberOfPhotos: Int {
        switch self {
        case .caoimhe: return 14
        case .saoirse: return 21
        case .morven: return 20
        }
    }
}


// MARK: - Static

extension Girl {
    static var allGirlsShuffled: [Girl] {
        return allCases.shuffled()
    }
}
