//
//  RoundedButton.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

// swiftlint:disable line_length

extension UIButton {

convenience init(nameIcon: String, sizeButton: Int, sizeIcon: Int, weightIcon: UIImage.SymbolWeight, backgroundColor: UIColor, tintColor: UIColor) {
        self.init()

        let configutationSizeIcon = UIImage.SymbolConfiguration(pointSize: CGFloat(sizeIcon))
        let confifurationWeightIcon = UIImage.SymbolConfiguration(weight: weightIcon)
        let configurations = configutationSizeIcon.applying(confifurationWeightIcon)

        let configutationNameIcon =  UIImage(systemName: nameIcon, withConfiguration: configurations)
        let icon = configutationNameIcon?.withTintColor(tintColor, renderingMode: .alwaysOriginal)

        self.setImage(icon, for: .normal)

        self.frame = CGRect(x: 0, y: 0, width: sizeButton, height: sizeButton)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.clipsToBounds = true
        self.backgroundColor = backgroundColor
    }

    func setCustomIcon(nameIcon: String, sizeIcon: Int, weightIcon: UIImage.SymbolWeight, tintColor: UIColor) {
        let configutationSizeIcon = UIImage.SymbolConfiguration(pointSize: CGFloat(sizeIcon))
        let confifurationWeightIcon = UIImage.SymbolConfiguration(weight: weightIcon)
        let configurations = configutationSizeIcon.applying(confifurationWeightIcon)

        let configutationNameIcon =  UIImage(systemName: nameIcon, withConfiguration: configurations)
        let icon = configutationNameIcon?.withTintColor(tintColor, renderingMode: .alwaysOriginal)

        self.setImage(icon, for: .normal)
    }

}
