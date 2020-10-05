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
    var palleteManager = PalletteManager()
    var pallette: ColorPallette!
    var icon = UIImageView()
    var playButton = UIButton()
    var storeButton = UIButton()
    var gameCenterButton = UIButton()
    var muteButton = UIButton()

    let circle: AnimatedCircleView = {
        let circle = AnimatedCircleView(lineWidth: 5)
        return circle
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        //uncomment to test the second pallete
        //_ = palleteManager.setActivePallete(palleteID: "1")
        self.pallette = setupPallette()
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

        setupCircle()
        setupCircleConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupPallette() -> ColorPallette {
        return palleteManager.getActivePallette()
    }
    func setupBackground() {
        self.backgroundColor = .systemGray6
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
        playButton = UIButton(nameIcon: "play.fill", sizeButton: 128, sizeIcon: 80, weightIcon: .bold, backgroundColor: .clear, tintColor: .label)
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
        storeButton = UIButton(nameIcon: "cart.fill", sizeButton: 68, sizeIcon: 36, weightIcon: .regular, backgroundColor: pallette.getColor(option: .thirdColor), tintColor: .label)
        self.addSubview(storeButton)
        storeButton.startAnimatingPressActions()
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
        gameCenterButton = UIButton(nameIcon: "star.fill", sizeButton: 68, sizeIcon: 36, weightIcon: .regular, backgroundColor: pallette.getColor(option: .primaryColor), tintColor: .label)
        self.addSubview(gameCenterButton)
        gameCenterButton.startAnimatingPressActions()
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
            muteButton = UIButton(nameIcon: "speaker.slash.fill", sizeButton: 68, sizeIcon: 36, weightIcon: .regular, backgroundColor: pallette.getColor(option: .secondaryColor), tintColor: .label)
        } else {
            muteButton = UIButton(nameIcon: "speaker.wave.2.fill", sizeButton: 68, sizeIcon: 36, weightIcon: .regular, backgroundColor: pallette.getColor(option: .secondaryColor), tintColor: .label)
        }
        self.addSubview(muteButton)
        muteButton.startAnimatingPressActions()
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
            muteButton.setCustomIcon(nameIcon: "speaker.slash.fill", sizeIcon: 36, weightIcon: .regular, tintColor: .label)
        } else {
            muteButton.setCustomIcon(nameIcon: "speaker.wave.2.fill", sizeIcon: 36, weightIcon: .regular, tintColor: .label)
        }
    }

    func setupCircle() {
        self.addSubview(self.circle)
    }

    func setupCircleConstraints() {
        self.circle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            circle.centerXAnchor.constraint(equalTo: self.playButton.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: self.playButton.centerYAnchor),
            circle.heightAnchor.constraint(equalTo: self.playButton.heightAnchor)
        ])

        self.circle.infinityAnimation(durationPerCycle: 2)
    }
}
