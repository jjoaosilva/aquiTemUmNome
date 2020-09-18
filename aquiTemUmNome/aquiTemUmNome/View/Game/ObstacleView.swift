//
//  ObstacleView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class ObstacleView: UIView {
    var cor: UIColor = UIColor()
    convenience init(cor: UIColor) {
        self.init()
        self.cor = cor
        self.backgroundColor = cor
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
