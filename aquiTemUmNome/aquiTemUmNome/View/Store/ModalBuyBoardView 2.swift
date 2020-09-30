//
//  ModalBuyBoardView.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 26/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
// swiftlint:disable line_length

import UIKit

class ModalBuyBoardView: UIView {
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
    let roundView: UIView = {
        let round = UIView()
        round.heightAnchor.constraint(equalToConstant: 107).isActive = true
        round.widthAnchor.constraint(equalToConstant: 107).isActive = true
        round.layer.cornerRadius = 107/2
        round.backgroundColor = .darkGray
        return round
    }()
    let coinsLabel: UILabel = {
        let lbl = UILabel()
            lbl.font = UIFont.systemFont(ofSize: 32, weight: .bold)
            lbl.text = "50"
        return lbl
    }()
    let coinImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Coin")
        return img
    }()
    let backgroundShape: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.heightAnchor.constraint(equalToConstant: 58).isActive = true
        view.widthAnchor.constraint(equalToConstant: 75).isActive = true
        return view
    }()
    let cancelButton: UIButton = {
            let btn = UIButton(nameIcon: "xmark", sizeButton: 68, sizeIcon: 24, weightIcon: .bold, backgroundColor: .systemRed, tintColor: .label)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.startAnimatingPressActions()
            return btn
        }()
    let buyButton: UIButton = {
            let btn = UIButton(nameIcon: "checkmark", sizeButton: 68, sizeIcon: 24, weightIcon: .bold, backgroundColor: .systemGreen, tintColor: .label)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.startAnimatingPressActions()
            return btn
        }()
    let primaryView = UIView()
    let secondaryView = UIView()
    let thirdView = UIView()
    let fourthView = UIView()
    let fifthView = UIView()
    let stackView = UIStackView()
    func setupModalView() {
        addSubview(roundView)
        roundView.translatesAutoresizingMaskIntoConstraints = false
        roundView.centerXAnchor.constraint(equalTo: modal.centerXAnchor).isActive = true
        roundView.topAnchor.constraint(equalTo: modal.topAnchor, constant: 24).isActive = true
        addSubview(backgroundShape)
        backgroundShape.translatesAutoresizingMaskIntoConstraints = false
        backgroundShape.centerYAnchor.constraint(equalTo: roundView.centerYAnchor).isActive = true
        backgroundShape.centerXAnchor.constraint(equalTo: roundView.centerXAnchor).isActive = true
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(primaryView)
        stackView.addArrangedSubview(secondaryView)
        stackView.addArrangedSubview(thirdView)
        stackView.addArrangedSubview(fourthView)
        stackView.addArrangedSubview(fifthView)
        stackView.leftAnchor.constraint(equalTo: backgroundShape.leftAnchor, constant: 4).isActive = true
        stackView.rightAnchor.constraint(equalTo: backgroundShape.rightAnchor, constant: -4).isActive = true
        stackView.topAnchor.constraint(equalTo: backgroundShape.topAnchor, constant: 3).isActive = true
        stackView.bottomAnchor.constraint(equalTo: backgroundShape.bottomAnchor, constant: -3).isActive = true
        addSubview(coinImage)
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        coinImage.rightAnchor.constraint(equalTo: roundView.centerXAnchor, constant: -5).isActive = true
        coinImage.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 12).isActive = true
        addSubview(coinsLabel)
        coinsLabel.translatesAutoresizingMaskIntoConstraints = false
        coinsLabel.centerYAnchor.constraint(equalTo: coinImage.centerYAnchor).isActive = true
        coinsLabel.leftAnchor.constraint(equalTo: roundView.centerXAnchor, constant: 5).isActive = true
        addSubview(cancelButton)
        cancelButton.rightAnchor.constraint(equalTo: modal.centerXAnchor, constant: -15).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: modal.bottomAnchor, constant: -24).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: cancelButton.bounds.size.width).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: cancelButton.bounds.size.height).isActive = true
        addSubview(buyButton)
        buyButton.leftAnchor.constraint(equalTo: modal.centerXAnchor, constant: 15).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: modal.bottomAnchor, constant: -24).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: buyButton.bounds.size.width).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: buyButton.bounds.size.height).isActive = true
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(blur)
        addSubview(modal)
        modal.translatesAutoresizingMaskIntoConstraints = false
        modal.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        modal.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        modal.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        modal.heightAnchor.constraint(equalToConstant: 285).isActive = true
        setupModalView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
