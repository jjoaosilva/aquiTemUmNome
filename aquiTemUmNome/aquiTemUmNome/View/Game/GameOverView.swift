//
//  GameOverView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 29/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//
// swiftlint:disable line_length

import UIKit

class GameOverView: UIView {
    lazy var blur: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()

    let modal: UIView = {
        let modalView = UIView()
        modalView.backgroundColor = .systemGray5
        modalView.layer.cornerRadius = 40
        modalView.translatesAutoresizingMaskIntoConstraints = false
        return modalView
    }()

    func modalConstraints() {
        NSLayoutConstraint.activate([
            modal.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            modal.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            modal.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            modal.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4)
        ])
    }

    let gameOverLabel: UILabel = {
        let label = UILabel()
        label.text = "GAME OVER"
        label.font = .systemFont(ofSize: 29, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func gameOverLabelConstraints() {
        NSLayoutConstraint.activate([
            gameOverLabel.centerXAnchor.constraint(equalTo: modal.centerXAnchor),
            gameOverLabel.centerYAnchor.constraint(equalTo: modal.centerYAnchor, constant: -99)
//            gameOverLabel.topAnchor.constraint(equalTo: modal.topAnchor, constant: 17)
        ])
    }

    let finalScore: UILabel = {
        let score = UILabel()
        score.text = "SCORE: 15"
        score.font = .systemFont(ofSize: 29, weight: .semibold)
        score.textColor = .label
        score.translatesAutoresizingMaskIntoConstraints = false
        return score
    }()

    func finalScoreConstraints() {
        NSLayoutConstraint.activate([
            finalScore.centerXAnchor.constraint(equalTo: modal.centerXAnchor),
            finalScore.centerYAnchor.constraint(equalTo: modal.centerYAnchor, constant: -44)
        ])
    }

    let bestScore: UILabel = {
        let score = UILabel()
        score.text = ""
        score.font = .systemFont(ofSize: 29, weight: .semibold)
        score.textColor = .label
        score.translatesAutoresizingMaskIntoConstraints = false
        return score
    }()

    func bestScoreConstraints() {
        NSLayoutConstraint.activate([
            bestScore.centerXAnchor.constraint(equalTo: modal.centerXAnchor),
            bestScore.centerYAnchor.constraint(equalTo: modal.centerYAnchor, constant: -13)
        ])
    }

    let homeButton: UIButton = {
        let color = PalletteManager().getActivePallette().getColor(option: .fifthColor)
        let homeButton = UIButton(nameIcon: "house.fill", sizeButton: 56, sizeIcon: 24, weightIcon: .bold, backgroundColor: color, tintColor: .white)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.startAnimatingPressActions()
        return homeButton
    }()

    func homeConstraints() {
        NSLayoutConstraint.activate([
            homeButton.heightAnchor.constraint(greaterThanOrEqualToConstant: homeButton.bounds.size.height),
            homeButton.widthAnchor.constraint(equalToConstant: homeButton.bounds.size.width),
            homeButton.topAnchor.constraint(equalTo: bestScore.bottomAnchor, constant: 34),
            homeButton.trailingAnchor.constraint(equalTo: modal.centerXAnchor, constant: -8)
        ])
    }

    let restartButton: UIButton = {
        let color = PalletteManager().getActivePallette().getColor(option: .fourthColor)
        let restartButton = UIButton(nameIcon: "arrow.counterclockwise", sizeButton: 56, sizeIcon: 24, weightIcon: .bold, backgroundColor: color, tintColor: .white)
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.startAnimatingPressActions()
        return restartButton
    }()

    func restartConstraints() {
        NSLayoutConstraint.activate([
            restartButton.heightAnchor.constraint(greaterThanOrEqualToConstant: restartButton.bounds.size.height),
            restartButton.widthAnchor.constraint(equalToConstant: restartButton.bounds.size.width),
            restartButton.topAnchor.constraint(equalTo: bestScore.bottomAnchor, constant: 34),
            restartButton.leadingAnchor.constraint(equalTo: modal.centerXAnchor, constant: 8)

        ])
    }

    override func layoutSubviews() {
        addSubview(blur)
        addSubview(modal)
        addSubview(gameOverLabel)
        addSubview(finalScore)
        addSubview(bestScore)
        addSubview(homeButton)
        addSubview(restartButton)
        modalConstraints()
        finalScoreConstraints()
        gameOverLabelConstraints()
        bestScoreConstraints()
        homeConstraints()
        restartConstraints()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
