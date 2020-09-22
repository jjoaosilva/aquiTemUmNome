//
//  StoreView.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
// swiftlint:disable trailing_whitespace

import UIKit

class StoreView: UIView {
    let backButton: UIButton = {
        let btn = UIButton()
            btn.setImage(UIImage(systemName: "arrowshape.turn.up.left.circle"), for: .normal)
            btn.contentVerticalAlignment = .fill
            btn.contentHorizontalAlignment = .fill
            btn.tintColor = .label
            btn.frame.size = CGSize(width: 50, height: 50)
        return btn
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
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.register(StoreTableViewCell.self, forCellReuseIdentifier: "cellID")
        return table
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backButton)
        self.backgroundColor = .systemBackground
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: backButton.bounds.size.width).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: backButton.bounds.size.height).isActive = true
        
        addSubview(coinsLabel)
        coinsLabel.translatesAutoresizingMaskIntoConstraints = false
        coinsLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        coinsLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        
        addSubview(coinImage)
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        coinImage.rightAnchor.constraint(equalTo: coinsLabel.leftAnchor, constant: -8).isActive = true
        coinImage.centerYAnchor.constraint(equalTo: coinsLabel.centerYAnchor).isActive = true
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 36).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
