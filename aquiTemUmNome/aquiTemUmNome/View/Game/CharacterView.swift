//
//  CharacterView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class CharacterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .red
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 18.5
        self.frame.size.height = 37
//        Adicionar a view
}
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
