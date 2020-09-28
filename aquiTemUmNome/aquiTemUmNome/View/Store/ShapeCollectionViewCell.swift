//
//  ShapeCollectionViewCell.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 21/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class ShapeCollectionViewCell: UICollectionViewCell {
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
    let shapeImageView: UIImageView = {
        let img = UIImageView()
        img.heightAnchor.constraint(equalToConstant: 56).isActive = true
        img.widthAnchor.constraint(equalToConstant: 56).isActive = true
        return img
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        addSubview(shapeImageView)
        shapeImageView.translatesAutoresizingMaskIntoConstraints = false
        shapeImageView.centerYAnchor.constraint(equalTo: roundView.centerYAnchor).isActive = true
        shapeImageView.centerXAnchor.constraint(equalTo: roundView.centerXAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
