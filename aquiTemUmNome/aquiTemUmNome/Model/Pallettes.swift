//
//  Pallettes.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//
//swiftlint:disable line_length
import Foundation
//quite dont know what to do here, might give it a change after
//maybe i can use a delegate pattern here
class Palletes {
    private var palletes: [ColorPallette] = []
    //standard pallette
    private let standardPallette = ColorPallette(primaryColor: .systemRed, secondaryColor: .systemBlue, thirdColor: .systemOrange, fourthColor: .systemGreen, fifthColor: .systemPurple)
    func addPallete(pallette: ColorPallette) {
        palletes.append(pallette)
    }
    func getPalletts() -> [ColorPallette] {
        return palletes
    }
}
