//
//  MenuView.swift
//  aquiTemUmNome
//
//  Created by Larissa Uchoa on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

// swiftlint:disable line_length

class MenuView: UIView {

    var pallette = ColorPallette(primaryColor: .systemRed, secondaryColor: .systemBlue, thirdColor: .systemOrange, fourthColor: .systemGreen, fifthColor: .systemPurple)
    var icon = UIImageView()
    var playButton = UIButton()
    var storeButton = UIButton()
    var gameCenterButton = UIButton()
    var muteButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupBackground()

        setupIcon()
        setupIconConstraints()

        setupPlayButton()
        setupPlayButtonConstraints()

        setupGameCenterButton()
        setupGameCenterButtonConstraints()

        setupStoreButton()
        setupStoreButtonConstraints()

        setupMuteButton()
        setupMuteButtonConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupBackground() {
        self.backgroundColor = .systemBackground
        //self.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
    }

    func setupIcon() {
        icon = UIImageView(image: UIImage(named: "Icon"))
        self.addSubview(icon)
    }

    func setupIconConstraints() {
        icon.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -160),
            icon.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func setupPlayButton() {
        playButton = UIButton(nameIcon: "play.fill", sizeButton: 128, sizeIcon: 80, weightIcon: .bold, backgroundColor: .clear, tintColor: .white)
        self.addSubview(playButton)
    }

    func setupPlayButtonConstraints() {
        playButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 89),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playButton.widthAnchor.constraint(equalToConstant: playButton.bounds.size.width),
            playButton.heightAnchor.constraint(equalToConstant: playButton.bounds.size.height)
        ])
    }

    func setupStoreButton() {
        storeButton = UIButton(nameIcon: "cart.fill", sizeButton: 68, sizeIcon: 36, weightIcon: .regular, backgroundColor: pallette.getColor(option: .thirdColor), tintColor: .white)
        self.addSubview(storeButton)
    }

    func setupStoreButtonConstraints() {
        storeButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            storeButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 24),
            storeButton.trailingAnchor.constraint(equalTo: gameCenterButton.leadingAnchor, constant: -24),
            storeButton.widthAnchor.constraint(equalToConstant: storeButton.bounds.size.width),
            storeButton.heightAnchor.constraint(equalToConstant: storeButton.bounds.size.height)
        ])
    }

    func setupGameCenterButton() {
        gameCenterButton = UIButton(nameIcon: "star.fill", sizeButton: 68, sizeIcon: 36, weightIcon: .regular, backgroundColor: pallette.getColor(option: .primaryColor), tintColor: .white)
        self.addSubview(gameCenterButton)
    }

    func setupGameCenterButtonConstraints() {
        gameCenterButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            gameCenterButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 52),
            gameCenterButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameCenterButton.widthAnchor.constraint(equalToConstant: gameCenterButton.bounds.size.width),
            gameCenterButton.heightAnchor.constraint(equalToConstant: gameCenterButton.bounds.size.height)
        ])
    }

    func setupMuteButton() {
        let status = UserDefaults.standard.bool(forKey: "mute")
        if status {
            muteButton = UIButton(nameIcon: "speaker.slash.fill", sizeButton: 68, sizeIcon: 36, weightIcon: .regular, backgroundColor: pallette.getColor(option: .secondaryColor), tintColor: .white)
        } else {
            muteButton = UIButton(nameIcon: "speaker.wave.2.fill", sizeButton: 68, sizeIcon: 36, weightIcon: .regular, backgroundColor: pallette.getColor(option: .secondaryColor), tintColor: .white)
        }
        self.addSubview(muteButton)
    }

    func setupMuteButtonConstraints() {
        muteButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            muteButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 24),
            muteButton.leadingAnchor.constraint(equalTo: gameCenterButton.trailingAnchor, constant: 24),
            muteButton.widthAnchor.constraint(equalToConstant: muteButton.bounds.size.width),
            muteButton.heightAnchor.constraint(equalToConstant: muteButton.bounds.size.height)
        ])
    }

    func updateMuteButton() {
        let status = UserDefaults.standard.bool(forKey: "mute")
        if status {
            muteButton.setCustomIcon(nameIcon: "speaker.slash.fill", sizeIcon: 36, weightIcon: .regular, tintColor: .white)
        } else {
            muteButton.setCustomIcon(nameIcon: "speaker.wave.2.fill", sizeIcon: 36, weightIcon: .regular, tintColor: .white)
        }
    }
}
