//
//  ObstacleView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class ObstacleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .red
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
