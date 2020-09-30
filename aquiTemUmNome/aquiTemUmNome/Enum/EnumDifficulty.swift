//
//  EnumDifficulty.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 22/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import Foundation

enum Difficulty {
    case easy
    case normal
    case hard

    var gravity: Float {
        switch self {
        case .easy:
            return 0.1
        case .normal:
            return 0.15
        case .hard:
            return 0.2
        }
    }

    var timeFrame: TimeInterval {
        switch self {
        case .easy:
            return 0.8
        case .normal:
            return 0.6
        case .hard:
            return 0.4
        }
    }
}
