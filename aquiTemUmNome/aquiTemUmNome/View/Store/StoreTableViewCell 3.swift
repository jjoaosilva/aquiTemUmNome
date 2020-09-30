//
//  StoreTableViewCell.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 21/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
// swiftlint:disable force_cast line_length control_statement

import UIKit

class StoreTableViewCell: UITableViewCell {
    //this variable will determine if the cell is a shape or board
    var section: Int?
    var palletes: [ColorPallette]?
    var shapes: [Shape]?
    let boardCollectionCellID = "BoardCollectionViewCellID"
    let shapeCollectionCellID = "ShapeCollectionViewCellID"
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cView.backgroundColor = .clear
        cView.showsHorizontalScrollIndicator = false

        return cView
    }()
    func setupView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = false
        collectionView.register(BoardCollectionViewCell.self, forCellWithReuseIdentifier: boardCollectionCellID)
        collectionView.register(ShapeCollectionViewCell.self, forCellWithReuseIdentifier: shapeCollectionCellID)
        collectionView.delegate = self
        collectionView.dataSource = self
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
extension StoreTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(self.section == 1) {
            return (palletes?.count) ?? 0
        } else {
            return (shapes?.count) ?? 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (section == 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: boardCollectionCellID, for: indexPath) as! BoardCollectionViewCell
            cell.primaryView.backgroundColor = palletes?[indexPath.row].getColor(option: .primaryColor)
            cell.secondaryView.backgroundColor = palletes?[indexPath.row].getColor(option: .secondaryColor)
            cell.thirdView.backgroundColor = palletes?[indexPath.row].getColor(option: .thirdColor)
            cell.fourthView.backgroundColor = palletes?[indexPath.row].getColor(option: .fourthColor)
            cell.fifthView.backgroundColor = palletes?[indexPath.row].getColor(option: .fifthColor)

            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shapeCollectionCellID, for: indexPath) as! ShapeCollectionViewCell
            cell.coinsLabel.text = String(shapes?[indexPath.row].price ?? 0)
            cell.shapeImageView.image = shapes?[indexPath.row].symbol
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.width / 2 )
    }
}
