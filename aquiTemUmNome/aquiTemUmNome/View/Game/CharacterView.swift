//
//  CharacterView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class CharacterView: UIView {

    var cor: UIColor = UIColor()

    convenience init(cor: UIColor, screenWidth: CGFloat) {
        self.init()
        self.cor = cor
        self.backgroundColor = cor
        self.layer.masksToBounds = true
        self.frame.size.width = CGFloat(screenWidth * 0.1)
        self.frame.size.height = CGFloat(screenWidth * 0.1)
        self.layer.cornerRadius = self.frame.size.width/2
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
