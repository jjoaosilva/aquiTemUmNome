//
//  PauseView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 18/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class PauseView: UIButton {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        self.setImage(UIImage.init(systemName: "pause"), for: .normal)
        self.tintColor = .white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
