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
    convenience init(cor: UIColor) {
        self.init()
        self.cor = cor
        self.backgroundColor = cor
        self.layer.cornerRadius = 18.5
        self.layer.masksToBounds = true
        self.bounds.size.height = 37
        self.bounds.size.width = 37
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
//        Adicionar a view
}
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
