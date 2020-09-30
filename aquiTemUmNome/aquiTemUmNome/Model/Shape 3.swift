//
//  Shape.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 21/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

struct Shape {
    let name: String
    let symbol: UIImage
    let price: Int
    //an ordinary name, the SF Symbols correspondent and its price on the store
    //ex: name = "Ball"; symbol = "circle.fill"; price = 50
    init(name: String, symbol: String, price: Int) {
        self.name = name
        self.symbol = UIImage(systemName: symbol) ?? UIImage()
        self.price = price
    }
}
