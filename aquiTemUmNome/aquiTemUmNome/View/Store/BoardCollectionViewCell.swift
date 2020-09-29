//
//  StoreCollectionViewCell.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 18/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.


import UIKit

class BoardCollectionViewCell: UICollectionViewCell {
    var pallete: ColorPallette?
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
        img.image = UIImage(named: "coin")
        return img
    }()
    let backgroundShape: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.heightAnchor.constraint(equalToConstant: 58).isActive = true
        view.widthAnchor.constraint(equalToConstant: 75).isActive = true
        return view
    }()
    let primaryView = UIView()
    let secondaryView = UIView()
    let thirdView = UIView()
    let fourthView = UIView()
    let fifthView = UIView()
    let stackView = UIStackView()
    let circle = AnimatedCircleView(lineWidth: 5, circleColor: .systemGreen, shadowColor: .clear)
    func setupView() {
        addSubview(roundView)
        roundView.translatesAutoresizingMaskIntoConstraints = false
        roundView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        roundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        addSubview(coinsLabel)
        coinsLabel.translatesAutoresizingMaskIntoConstraints = false
        coinsLabel.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 8).isActive = true
        coinsLabel.rightAnchor.constraint(equalTo: roundView.rightAnchor, constant: -12).isActive = true
        addSubview(coinImage)
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        coinImage.centerYAnchor.constraint(equalTo: coinsLabel.centerYAnchor).isActive = true
        coinImage.leftAnchor.constraint(equalTo: roundView.leftAnchor, constant: 12).isActive = true
        addSubview(backgroundShape)
        backgroundShape.translatesAutoresizingMaskIntoConstraints = false
        backgroundShape.centerYAnchor.constraint(equalTo: roundView.centerYAnchor).isActive = true
        backgroundShape.centerXAnchor.constraint(equalTo: roundView.centerXAnchor).isActive = true
    }
    func setupStackView() {
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
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupStackView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
