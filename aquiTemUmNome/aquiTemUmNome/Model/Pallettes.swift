//
//  Pallettes.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//
//swiftlint:disable line_length
import Foundation
class Palletes {
    private var palletes: [ColorPallette] = []
    //standard pallette
    private let standardPallette = ColorPallette(primaryColor: .systemRed, secondaryColor: .systemBlue, thirdColor: .systemOrange, fourthColor: .systemGreen, fifthColor: .magenta, id: 0)
    private let secondaryPallette = ColorPallette(primaryColor: .customLightBlue, secondaryColor: .customMossGreen, thirdColor: .customOrange, fourthColor: .customDarkBlue, fifthColor: .customPink, id: 1)
    init() {
        palletes.append(standardPallette)
        palletes.append(secondaryPallette)
    }
    func addPallete(pallette: ColorPallette) {
        palletes.append(pallette)
    }
    func getPalletts() -> [ColorPallette] {
        return palletes
    }
}
