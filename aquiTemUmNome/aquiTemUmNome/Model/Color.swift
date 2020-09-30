//
//  Color.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 25/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

struct Color: Codable {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var alpha: CGFloat?
    var uiColor: UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha ?? 1)
    }
    init() {
        self.red = 1
        self.green = 1
        self.blue = 1
        self.alpha = 1
    }
}
