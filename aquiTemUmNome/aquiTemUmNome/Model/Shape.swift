//
//  Shape.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 21/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
// swiftlint:disable identifier_name

import UIKit

class Shape: Codable {
    private var id: UUID
    private let name: String
    private let symbol: String
    private let price: Int
    private var isBought: Bool
    //an ordinary name, the SF Symbols correspondent and its price on the store
    //ex: name = "Ball"; symbol = "circle.fill"; price = 50
    init(name: String, symbol: String, price: Int, boughtState: Bool = false) {
        self.id = UUID()
        self.name = name
        self.symbol = symbol
        self.price = price
        self.isBought = boughtState
    }
    func getID() -> UUID {
        return id
    }
    func getPrice() -> Int {
        return self.price
    }
    func getBoughtState() -> Bool {
        return isBought
    }
    func setBoughtState(state: Bool) {
        self.isBought = state
    }
    func getSystemImage() -> UIImage {
        return UIImage(systemName: self.symbol) ?? UIImage()
    }
    func getSymbolName() -> String {
        return self.symbol
    }
}
