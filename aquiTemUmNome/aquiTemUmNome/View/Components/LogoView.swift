//
//  LogoView.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 07/10/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class LogoView: UIView {

    var topRectangle: UIImageView = {
        var color = PalletteManager().getActivePallette().getColor(option: .fourthColor)
        let image = UIImageView(image: UIImage(named: "LogoTop")?.withTintColor(color))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var topCornerRectangle: UIImageView = {
        var color = PalletteManager().getActivePallette().getColor(option: .fourthColor)
        let image = UIImageView(image: UIImage(named: "LogoTopCorner")?.withTintColor(color))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var rightRectangle: UIImageView = {
        let color = PalletteManager().getActivePallette().getColor(option: .thirdColor)
        let image = UIImageView(image: UIImage(named: "LogoRight")?.withTintColor(color))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var rightBottomRectangle: UIImageView = {
        let color = PalletteManager().getActivePallette().getColor(option: .fifthColor)
        let image = UIImageView(image: UIImage(named: "LogoRightBottom")?.withTintColor(color))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var leftBottomRectangle: UIImageView = {
        let color = PalletteManager().getActivePallette().getColor(option: .secondaryColor)
        let image = UIImageView(image: UIImage(named: "LogoLeftBottom")?.withTintColor(color))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var leftRectangle: UIImageView = {
        let color = PalletteManager().getActivePallette().getColor(option: .primaryColor)
        let image = UIImageView(image: UIImage(named: "LogoLeft")?.withTintColor(color))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.addSubViews()
        self.setup()
    }

    private func addSubViews() {
        self.addSubview(topRectangle)
        self.addSubview(leftRectangle)
        self.addSubview(leftBottomRectangle)
        self.addSubview(rightBottomRectangle)
        self.addSubview(rightRectangle)
        self.addSubview(topCornerRectangle)
    }

    private func setup() {
        NSLayoutConstraint.activate([
            self.topRectangle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.topRectangle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.topRectangle.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.topRectangle.heightAnchor.constraint(equalTo: self.heightAnchor),

            self.topCornerRectangle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.topCornerRectangle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.topCornerRectangle.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.topCornerRectangle.heightAnchor.constraint(equalTo: self.heightAnchor),

            self.rightRectangle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.rightRectangle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.rightRectangle.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.rightRectangle.heightAnchor.constraint(equalTo: self.heightAnchor),

            self.rightBottomRectangle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.rightBottomRectangle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.rightBottomRectangle.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.rightBottomRectangle.heightAnchor.constraint(equalTo: self.heightAnchor),

            self.leftBottomRectangle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.leftBottomRectangle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.leftBottomRectangle.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.leftBottomRectangle.heightAnchor.constraint(equalTo: self.heightAnchor),

            self.leftRectangle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.leftRectangle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.leftRectangle.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.leftRectangle.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
