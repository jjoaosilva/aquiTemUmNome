//
//  PauseView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 18/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//
// swiftlint:disable line_length
import UIKit

class PauseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        let pause = UIButton(nameIcon: "Pause", sizeButton: 42, sizeIcon: 29, weightIcon: .semibold, backgroundColor: .clear, tintColor: .white)
        pause.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pause)
        pause.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
