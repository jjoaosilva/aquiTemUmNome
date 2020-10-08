//
//  RoundedButton.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

// swiftlint:disable line_length

class RoundedButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    var icon: UIImage?

    convenience init(frame: CGRect, nameIcon: String, sizeButton: Int, sizeIcon: Int, weightIcon: UIImage.SymbolWeight, backgroundColor: UIColor, tintColor: UIColor) {

        self.init(frame: frame)
        let configurationSizeIcon = UIImage.SymbolConfiguration(pointSize: CGFloat(sizeIcon))
        let configurationWeightIcon = UIImage.SymbolConfiguration(weight: weightIcon)
        let configurations = configurationSizeIcon.applying(configurationWeightIcon)
        let configurationNameIcon =  UIImage(systemName: nameIcon, withConfiguration: configurations)
        self.icon = configurationNameIcon?.withTintColor(tintColor, renderingMode: .alwaysOriginal)

        self.setImage(icon, for: .normal)
        self.frame = CGRect(x: 0, y: 0, width: sizeButton, height: sizeButton)
        self.clipsToBounds = true
        self.backgroundColor = backgroundColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
