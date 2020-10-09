//
//  EnumDifficulty.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 22/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import Foundation

enum Difficulty {
    case easiest
    case easy
    case normal
    case hard
    case hardest

    var gravity: Float {
        switch self {
        case .easiest:
            return 0.1
        case .easy:
            return 0.12
        case .normal:
            return 0.15
        case .hard:
            return 0.18
        case .hardest:
            return 0.20
        }
    }

    var timeFrame: TimeInterval {
        switch self {
        case .easiest:
            return 1.0
        case .easy:
            return 0.8
        case .normal:
            return 0.6
        case .hard:
            return 0.4
        case .hardest:
            return 0.3
        }
    }
}
