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
    let blur: ModalView = {
        let view = ModalView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let modal: UIView = {
        let modalView = UIView()
        modalView.backgroundColor = .systemGray6
        modalView.layer.cornerRadius = 40

        modalView.translatesAutoresizingMaskIntoConstraints = false
        return modalView
    }()
    let playButton: UIButton = {
        let playButton = UIButton(nameIcon: "play.fill", sizeButton: 95, sizeIcon: 55, weightIcon: .bold, backgroundColor: .clear, tintColor: .label)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(blur)
        self.addSubview(modal)
        modal.addSubview(playButton)
//        self.addSubview(playButton)
//        self.modal.modalView.addSubview(playButton)
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .green
    }
    func setup() {
        NSLayoutConstraint.activate([
            blur.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            blur.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            modal.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            modal.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            modal.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            modal.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            playButton.centerXAnchor.constraint(equalTo: modal.centerXAnchor),
            playButton.topAnchor.constraint(equalTo: modal.topAnchor, constant: 44),
            playButton.heightAnchor.constraint(equalToConstant: playButton.bounds.size.height)
//            playButton.widthAnchor.constraint(equalToConstant: playButton.bounds.size.width)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
