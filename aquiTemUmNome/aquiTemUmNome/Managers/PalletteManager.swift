//
//  PalletteManager.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 24/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
// swiftlint:disable control_statement line_length

import Foundation

class PalletteManager {
    //this var represents the UUID of the pallette, making each one unique
    private var activePalletteID: String {
        return UserDefaults.standard.string(forKey: "activePalletteID") ?? "activePalleteID could not be found"
    }
    private let palletes = PallettesRepository().readAllItems()
    public func getActivePallette() -> ColorPallette {
        let activeID = activePalletteID
        for pallete in palletes {
            if(pallete.getID().uuidString == activeID) {
                return pallete
            }
        }
        //if the active pallette could not be found, it returns the standard one
        return ColorPallette(primaryColor: .systemRed, secondaryColor: .systemBlue, thirdColor: .systemOrange, fourthColor: .systemGreen, fifthColor: .magenta)
    }
    //this func sets the ActivePallete, mainly used in the store. if the pallete could be set, returns true
    public func setActivePallete(palleteID: String) -> Bool {
        for pallete in palletes {
            if (pallete.getID().uuidString == palleteID) {
                UserDefaults.standard.setValue(palleteID, forKey: "activePalletteID")
                return true
            }
        }
        //the pallette could not be set
        return false
    }
}
