//
//  Shapes.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 21/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import Foundation

class Shapes {
    private var shapes: [Shape] = []
    //use this for tests
    func mockup() {
        var standardShapes: [Shape] = []
        standardShapes.append(Shape(name: "Ball", symbol: "circle.fill", price: 50))
        standardShapes.append(Shape(name: "Star", symbol: "star.fill", price: 90))
        standardShapes.append(Shape(name: "Shield", symbol: "shield.fill", price: 80))
        standardShapes.append(Shape(name: "Hexagon", symbol: "hexagon.fill", price: 70))
        shapes.append(contentsOf: standardShapes)
    }
    func addShape(shape: Shape) {
        shapes.append(shape)
    }
    func getShapes() -> [Shape] {
        return shapes
    }
}
