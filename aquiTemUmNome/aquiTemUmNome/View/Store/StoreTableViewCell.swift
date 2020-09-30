//
//  StoreTableViewCell.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 21/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    let collectionViewController: StoreCollectionViewController = {
        let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.estimatedItemSize = .zero
        let cView = StoreCollectionViewController(collectionViewLayout: layout)
            cView.view.backgroundColor = .clear
        return cView
    }()
    func setupView() {
        addSubview(collectionViewController.view)
        collectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        collectionViewController.view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionViewController.view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionViewController.view.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        collectionViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = false
        setupView()
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
