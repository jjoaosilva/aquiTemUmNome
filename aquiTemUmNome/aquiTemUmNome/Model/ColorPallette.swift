//
//  ColorPallette.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//
// swiftlint:disable line_length
import UIKit

class ColorPallette {
    private var primaryColor: UIColor
    private var secondaryColor: UIColor
    private var thirdColor: UIColor
    private var fourthColor: UIColor
    private var fifthColor: UIColor
    init(primaryColor: UIColor, secondaryColor: UIColor, thirdColor: UIColor, fourthColor: UIColor, fifthColor: UIColor) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.thirdColor = thirdColor
        self.fourthColor = fourthColor
        self.fifthColor = fifthColor
    }
    //you can choose this function to get an specific color by its type
    //ex: pallette.getColor(ColorType.thirdOption)
    func getColor(option: ColorType) -> UIColor {
        switch option {
        case .primaryColor:
            return self.primaryColor
        case .secondaryColor:
            return self.secondaryColor
        case .thirdColor:
            return self.thirdColor
        case .fourthColor:
            return self.fourthColor
        case .fifthColor:
            return self.fifthColor
        }
    }
}
