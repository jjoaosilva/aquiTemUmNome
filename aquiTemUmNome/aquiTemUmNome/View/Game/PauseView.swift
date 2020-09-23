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
    lazy var blur: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
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
        playButton.layer.borderWidth = 4
        playButton.layer.borderColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    let homeButton: UIButton = {
        let homeButton = UIButton(nameIcon: "house", sizeButton: 56, sizeIcon: 24, weightIcon: .regular, backgroundColor: .systemPurple, tintColor: .label)
        homeButton.addTarget(self, action: #selector(homeAction),
                             for: .touchUpInside)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        return homeButton
    }()
    @objc func homeAction() {
        print("navigation")
    }
    let speakerButton: UIButton = {
        let speakerButton = UIButton(nameIcon: "speaker.slash.fill", sizeButton: 56, sizeIcon: 24, weightIcon: .regular, backgroundColor: .systemBlue, tintColor: .label)
        speakerButton.translatesAutoresizingMaskIntoConstraints = false
        return speakerButton
    }()
    let restartButton: UIButton = {
        let restartButton = UIButton(nameIcon: "arrow.counterclockwise", sizeButton: 56, sizeIcon: 24, weightIcon: .regular, backgroundColor: .systemGreen, tintColor: .label)
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        return restartButton
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(blur)
        self.addSubview(modal)
        modal.addSubview(playButton)
        modal.addSubview(homeButton)
        modal.addSubview(speakerButton)
        modal.addSubview(restartButton)
        setupConstraint()
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(blur)
        self.backgroundColor = .clear
    }
    func setupConstraint() {
        NSLayoutConstraint.activate([
            modal.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            modal.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            modal.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            modal.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            //            play
            playButton.centerXAnchor.constraint(equalTo: modal.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: modal.centerYAnchor, constant: -39.5),
            playButton.heightAnchor.constraint(equalToConstant: playButton.bounds.size.height),
            playButton.widthAnchor.constraint(equalToConstant: playButton.bounds.size.width),
            //            home
            homeButton.heightAnchor.constraint(greaterThanOrEqualToConstant: homeButton.bounds.size.height),
            homeButton.widthAnchor.constraint(equalToConstant: homeButton.bounds.size.width),
            homeButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 17),
            homeButton.leadingAnchor.constraint(equalTo: modal.leadingAnchor, constant: 28),
            //            speaker
            speakerButton.heightAnchor.constraint(equalToConstant: speakerButton.bounds.size.height),
            speakerButton.widthAnchor.constraint(equalToConstant: speakerButton.bounds.size.width),
            //            speakerButton.heightAnchor.constraint(equalTo: modal.heightAnchor, multiplier: 0.207),
            //            speakerButton.widthAnchor.constraint(equalTo: speakerButton.heightAnchor),
            speakerButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 45),
            speakerButton.centerXAnchor.constraint(equalTo: modal.centerXAnchor),
            //            restart
            restartButton.heightAnchor.constraint(greaterThanOrEqualToConstant: restartButton.bounds.size.height),
            restartButton.widthAnchor.constraint(equalToConstant: restartButton.bounds.size.width),
            restartButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 17),
            restartButton.leadingAnchor.constraint(greaterThanOrEqualTo: speakerButton.trailingAnchor, constant: 19),
            restartButton.trailingAnchor.constraint(equalTo: modal.trailingAnchor, constant: -28)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
