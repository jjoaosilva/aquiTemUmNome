//
//  ModalView.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class ModalView: UIView {

    lazy var blur: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)

        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        return blurEffectView
    }()

    let modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 40

        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        self.addSubViews()
        self.setup()
    }

    private func addSubViews() {
        self.addSubview(blur)
        self.addSubview(modalView)
    }

    private func setup() {
        NSLayoutConstraint.activate([
            modalView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            modalView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            modalView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            modalView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4)
        ])
    }
}
