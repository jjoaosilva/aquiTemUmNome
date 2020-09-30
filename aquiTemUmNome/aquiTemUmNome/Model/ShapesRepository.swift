//
//  ShapesRepository.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 29/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
// swiftlint:disable identifier_name

import Foundation
class ShapesRepository: Codable {
    var items: [Shape] = []
    func createNewItem(name: String, symbol: String, price: Int, boughtState: Bool = false) -> Shape {
        let newItem = Shape(name: name, symbol: symbol, price: price, boughtState: boughtState)
        items.append(newItem)
        if let data = try? JSONEncoder().encode(newItem) {
            FileHelper().createFile(with: data, name: newItem.getID().uuidString)
        }
        return newItem
    }
    func readAllItems() -> [Shape] {
        //read from persistance file
        let fileNames: [String] = FileHelper().contentsForDirectory(atPath: "")
        self.items = fileNames.compactMap {(fileName) -> Shape? in
            if let data = FileHelper().retrieveFile(at: fileName) {
                //decode from Data to Pallettes type
                let item = try? JSONDecoder().decode(Shape.self, from: data)
                return item
            }
            return nil
        }
        return items
    }
    func readItem(id: UUID) -> Shape? {
        if let data = FileHelper().retrieveFile(at: id.uuidString) {
            let item = try? JSONDecoder().decode(Shape.self, from: data)
            return item
        }
        return nil
    }
    func update(item: Shape) {
        if let data = try? JSONEncoder().encode(item) {
            FileHelper().updateFile(at: item.getID().uuidString, data: data)
        }
    }
    func delete(id: UUID) {
        FileHelper().removeFile(at: id.uuidString)
    }
}
