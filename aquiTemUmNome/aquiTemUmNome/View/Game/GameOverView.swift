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
        label.font = .systemFont(ofSize: 31, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let finalScore: UILabel = {
        let score = UILabel()
        score.text = ""
        score.font = .systemFont(ofSize: 29, weight: .semibold)
        score.textColor = .label
        score.translatesAutoresizingMaskIntoConstraints = false
        return score
    }()

    let bestScore: UILabel = {
        let score = UILabel()
        score.text = ""
        score.font = .systemFont(ofSize: 29, weight: .semibold)
        score.textColor = .label
        score.translatesAutoresizingMaskIntoConstraints = false
        return score
    }()

    let homeButton: RoundedButton = {
        let color = PalletteManager().getActivePallette().getColor(option: .fifthColor)
        let homeButton = RoundedButton(frame: .zero, nameIcon: "house.fill", sizeButton: 56, sizeIcon: 24, weightIcon: .bold, backgroundColor: color, tintColor: .white)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.startAnimatingPressActions()
        return homeButton
    }()

    func homeConstraints() {
        NSLayoutConstraint.activate([
            homeButton.heightAnchor.constraint(equalTo: modal.heightAnchor, multiplier: 0.207),
            homeButton.widthAnchor.constraint(equalTo: homeButton.heightAnchor)
        ])
    }

    let restartButton: UIButton = {
        let color = PalletteManager().getActivePallette().getColor(option: .fourthColor)
        let restartButton = RoundedButton(frame: .zero, nameIcon: "arrow.counterclockwise", sizeButton: 56, sizeIcon: 24, weightIcon: .bold, backgroundColor: color, tintColor: .white)
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.startAnimatingPressActions()
        return restartButton
    }()

    func restartConstraints() {
        NSLayoutConstraint.activate([
            restartButton.heightAnchor.constraint(equalTo: modal.heightAnchor, multiplier: 0.207),
            restartButton.widthAnchor.constraint(equalTo: restartButton.heightAnchor)
        ])
    }

    let stackVertical = UIStackView()
    func setupVerticalStackView() {
        stackVertical.axis  = NSLayoutConstraint.Axis.vertical
        stackVertical.distribution  = UIStackView.Distribution.equalSpacing
        stackVertical.alignment = UIStackView.Alignment.center
        stackVertical.spacing   = 16.0
        stackVertical.translatesAutoresizingMaskIntoConstraints = false
        self.modal.addSubview(stackVertical)

        NSLayoutConstraint.activate([
            stackVertical.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackVertical.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    let stackHorizontal = UIStackView()
    func setupHorizontalStackView() {
        stackHorizontal.axis  = NSLayoutConstraint.Axis.horizontal
        stackHorizontal.distribution  = UIStackView.Distribution.equalSpacing
        stackHorizontal.alignment = UIStackView.Alignment.center
        stackHorizontal.spacing   = 16.0
        stackHorizontal.translatesAutoresizingMaskIntoConstraints = false
    }

    override func layoutSubviews() {
        layoutIfNeeded()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        addSubview(blur)
        addSubview(modal)
        addSubview(stackVertical)
        stackVertical.addArrangedSubview(gameOverLabel)
        stackVertical.addArrangedSubview(finalScore)
        stackVertical.addArrangedSubview(bestScore)
        stackVertical.addArrangedSubview(stackHorizontal)
        stackHorizontal.addArrangedSubview(homeButton)
        stackHorizontal.addArrangedSubview(restartButton)
        modalConstraints()
        homeConstraints()
        restartConstraints()
        setupVerticalStackView()
        setupHorizontalStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
