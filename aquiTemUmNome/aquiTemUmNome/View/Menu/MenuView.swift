//
//  MenuView.swift
//  aquiTemUmNome
//
//  Created by Larissa Uchoa on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class MenuView: UIView {

    var icon = UIImageView()
    var playButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupBackground()
        setupIcon()
        setupIconConstraints()
        setupPlayButton()
        setupPlayButtonConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupBackground() {
        self.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
    }

    func setupIcon() {
        icon = UIImageView(image: UIImage(named: "Icon"))
        self.addSubview(icon)
    }

    func setupIconConstraints() {
        icon.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 74),
            icon.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func setupPlayButton() {
        playButton.contentVerticalAlignment = .fill
        playButton.contentHorizontalAlignment = .fill
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.tintColor = .white
        self.addSubview(playButton)
    }

    func setupPlayButtonConstraints() {
        playButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 89),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 74),
            playButton.widthAnchor.constraint(equalToConstant: 68)
        ])
    }

}
