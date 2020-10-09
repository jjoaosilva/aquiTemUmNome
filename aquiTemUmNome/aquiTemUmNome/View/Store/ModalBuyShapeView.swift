//
//  ModalBuyShapeView.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 29/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
// swiftlint:disable line_length

import UIKit

class ModalBuyShapeView: UIView {

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
    let roundView: UIView = {
        let round = UIView()
        round.heightAnchor.constraint(equalToConstant: 107).isActive = true
        round.widthAnchor.constraint(equalToConstant: 107).isActive = true
        round.layer.cornerRadius = 107/2
        round.backgroundColor = .systemGray4
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
    let cancelButton: UIButton = {
            let btn = UIButton(nameIcon: "xmark", sizeButton: 68, sizeIcon: 24, weightIcon: .bold, backgroundColor: .systemRed, tintColor: .white)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.startAnimatingPressActions()
            return btn
        }()
    let buyButton: UIButton = {
            let btn = UIButton(nameIcon: "checkmark", sizeButton: 68, sizeIcon: 24, weightIcon: .bold, backgroundColor: .systemGreen, tintColor: .white)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.startAnimatingPressActions()
            return btn
        }()
    let shapeImage = UIImageView()
    func setupModalView() {
        addSubview(roundView)
        roundView.translatesAutoresizingMaskIntoConstraints = false
        roundView.centerXAnchor.constraint(equalTo: modal.centerXAnchor).isActive = true
        roundView.topAnchor.constraint(equalTo: modal.topAnchor, constant: 24).isActive = true
        addSubview(shapeImage)
        shapeImage.translatesAutoresizingMaskIntoConstraints = false
        shapeImage.centerXAnchor.constraint(equalTo: roundView.centerXAnchor).isActive = true
        shapeImage.centerYAnchor.constraint(equalTo: roundView.centerYAnchor).isActive = true
        shapeImage.widthAnchor.constraint(equalToConstant: 56).isActive = true
        shapeImage.heightAnchor.constraint(equalToConstant: 56).isActive = true
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
