//
//  ShapeManager.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 29/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
// swiftlint:disable control_statement

import Foundation

class ShapeManager {
    //this var represents the UUID of the pallette, making each one unique
    private var activeShapeID: String {
        return UserDefaults.standard.string(forKey: "activeShapeID") ?? "activeShapeID could not be found"
    }
    private let shapes = ShapesRepository().readAllItems()
    public func getActiveShape() -> Shape {
        let activeID = activeShapeID
        for shape in shapes {
            if (shape.getID().uuidString == activeID) {
                return shape
            }
        }
        //if the active pallette could not be found, it returns the standard one
        return shapes[0]
    }
    //this func sets the ActiveShape, mainly used in the store and game. if the pallete could be set, returns true
    public func setActiveShape(shapeID: String) -> Bool {
        for shape in shapes {
            if (shape.getID().uuidString == shapeID) {
                UserDefaults.standard.setValue(shapeID, forKey: "activeShapeID")
                return true
            }
        }
        //the shape could not be set
        return false
    }
}
