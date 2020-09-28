//
//  PalletesRepository.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 25/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
// swiftlint:disable identifier_name line_length

import UIKit

class PallettesRepository: Codable {
    var items: [ColorPallette] = []
    func createNewItem(primaryColor: UIColor, secondaryColor: UIColor, thirdColor: UIColor, fourthColor: UIColor, fifthColor: UIColor, price: Int = 50 ) -> ColorPallette {
        let newItem = ColorPallette(primaryColor: primaryColor, secondaryColor: secondaryColor, thirdColor: thirdColor, fourthColor: fourthColor, fifthColor: fifthColor, price: price)
        items.append(newItem)
        if let data = try? JSONEncoder().encode(newItem) {
            FileHelper().createFile(with: data, name: newItem.getID().uuidString)
        }
        return newItem
    }
    func readAllItems() -> [ColorPallette] {
        //read from persistance file
        let fileNames: [String] = FileHelper().contentsForDirectory(atPath: "")
        self.items = fileNames.compactMap {(fileName) -> ColorPallette? in
            if let data = FileHelper().retrieveFile(at: fileName) {
                //decode from Data to Pallettes type
                let item = try? JSONDecoder().decode(ColorPallette.self, from: data)
                return item
            }
            return nil
        }
        return items
    }
    func readItem(id: UUID) -> ColorPallette? {
        if let data = FileHelper().retrieveFile(at: id.uuidString) {
            let item = try? JSONDecoder().decode(ColorPallette.self, from: data)
            return item
        }
        return nil
    }
    func update(item: ColorPallette) {
        if let data = try? JSONEncoder().encode(item) {
            FileHelper().updateFile(at: item.getID().uuidString, data: data)
        }
    }
    func delete(id: UUID) {
        FileHelper().removeFile(at: id.uuidString)
    }
}
