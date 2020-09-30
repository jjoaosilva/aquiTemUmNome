//
//  ColorPallette.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//
// swiftlint:disable line_length identifier_name
import UIKit

class ColorPallette: Codable {
    private var id: UUID
    private var primaryColor: Color = Color()
    private var secondaryColor: Color = Color()
    private var thirdColor: Color = Color()
    private var fourthColor: Color = Color()
    private var fifthColor: Color = Color()
    private var isBought = false
    private var price: Int?
    init(primaryColor: UIColor, secondaryColor: UIColor, thirdColor: UIColor, fourthColor: UIColor, fifthColor: UIColor, price: Int = 50, boughtState: Bool = false) {
        self.id = UUID()
        self.primaryColor.red = primaryColor.redValue as CGFloat
        self.primaryColor.blue = primaryColor.blueValue as CGFloat
        self.primaryColor.green = primaryColor.greenValue as CGFloat
        self.secondaryColor.red = secondaryColor.redValue as CGFloat
        self.secondaryColor.blue = secondaryColor.blueValue as CGFloat
        self.secondaryColor.green = secondaryColor.greenValue as CGFloat
        self.thirdColor.red = thirdColor.redValue as CGFloat
        self.thirdColor.blue = thirdColor.blueValue as CGFloat
        self.thirdColor.green = thirdColor.greenValue as CGFloat
        self.fourthColor.red = fourthColor.redValue as CGFloat
        self.fourthColor.blue = fourthColor.blueValue as CGFloat
        self.fourthColor.green = fourthColor.greenValue as CGFloat
        self.fifthColor.red = fifthColor.redValue as CGFloat
        self.fifthColor.blue = fifthColor.blueValue as CGFloat
        self.fifthColor.green = fifthColor.greenValue as CGFloat
        self.price = price
        self.isBought = boughtState
    }
    //you can choose this function to get an specific color by its type
    //ex: pallette.getColor(ColorType.thirdOption)
    func getColor(option: ColorType) -> UIColor {
        switch option {
        case .primaryColor:
            return UIColor(red: primaryColor.red, green: primaryColor.green, blue: primaryColor.blue, alpha: 1)
        case .secondaryColor:
            return UIColor(red: secondaryColor.red, green: secondaryColor.green, blue: secondaryColor.blue, alpha: 1)
        case .thirdColor:
            return UIColor(red: thirdColor.red, green: thirdColor.green, blue: thirdColor.blue, alpha: 1)
        case .fourthColor:
            return UIColor(red: fourthColor.red, green: fourthColor.green, blue: fourthColor.blue, alpha: 1)
        case .fifthColor:
            return UIColor(red: fifthColor.red, green: fifthColor.green, blue: fifthColor.blue, alpha: 1)
        }
    }
    func getID() -> UUID {
        return id
    }
    func getPrice() -> Int {
        return self.price ?? -50
    }
    func getBoughtState() -> Bool {
        return isBought
    }
    func setBoughtState(state: Bool) {
        self.isBought = state
    }
}
