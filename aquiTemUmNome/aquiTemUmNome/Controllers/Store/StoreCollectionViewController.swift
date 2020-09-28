//
//  StoreCollectionViewController.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 27/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
// swiftlint:disable force_cast control_statement line_length

import UIKit

class StoreCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, BuyContentFromStoreDelegate {
    var section: Int?
    var palletes = PallettesRepository().readAllItems()
    var shapes: [Shape]?
    let boardCollectionCellID = "BoardCollectionViewCellID"
    let shapeCollectionCellID = "ShapeCollectionViewCellID"
    //delegate function
    func buyAction(_ indexPath: IndexPath) {
        print("bought at ", indexPath)
        collectionView.reloadItems(at: [indexPath])
    }
    func presentModalBoard(_ pallette: ColorPallette, indexPath: IndexPath) {
        let viewController = ModalBuyBoardViewController()
            viewController.delegate = self
            viewController.modalBuyBoardView.coinsLabel.text = String(palletes[indexPath.row].getPrice())
            viewController.modalBuyBoardView.primaryView.backgroundColor = palletes[indexPath.row].getColor(option: .primaryColor)
            viewController.modalBuyBoardView.secondaryView.backgroundColor = palletes[indexPath.row].getColor(option: .secondaryColor)
            viewController.modalBuyBoardView.thirdView.backgroundColor = palletes[indexPath.row].getColor(option: .thirdColor)
            viewController.modalBuyBoardView.fourthView.backgroundColor = palletes[indexPath.row].getColor(option: .fourthColor)
            viewController.modalBuyBoardView.fifthView.backgroundColor = palletes[indexPath.row].getColor(option: .fifthColor)
            viewController.indexPath = indexPath
        let modalBuyBoard = UINavigationController(rootViewController: viewController)
            modalBuyBoard.modalPresentationStyle = .fullScreen
            modalBuyBoard.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            modalBuyBoard.navigationBar.shadowImage = UIImage()
        self.present(modalBuyBoard, animated: true, completion: nil)
    }
    func animateBoardCell(_ cell: BoardCollectionViewCell) {
        let circle = AnimatedCircleView(lineWidth: 5, circleColor: .systemGreen, shadowColor: .clear)
        cell.addSubview(circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circle.centerXAnchor.constraint(equalTo: cell.roundView.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: cell.roundView.centerYAnchor),
            circle.heightAnchor.constraint(equalTo: cell.roundView.heightAnchor)
        ])
        circle.completeAnimation(with: 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(BoardCollectionViewCell.self, forCellWithReuseIdentifier: boardCollectionCellID)
        collectionView.register(ShapeCollectionViewCell.self, forCellWithReuseIdentifier: shapeCollectionCellID)
        collectionView.showsHorizontalScrollIndicator = false
    }
    //click on cell
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //pallete collection
        if(self.section == 1) {
            let cell = collectionView.cellForItem(at: indexPath) as! BoardCollectionViewCell
            //this is what happens when the user clicks on a board that wasnt bought yet
            if(cell.pallete!.getBoughtState() == false) {
                //gets if the user bought the Item
                presentModalBoard(cell.pallete!, indexPath: indexPath)

            } else {
                //animation fill
                animateBoardCell(cell)
                _ = PalletteManager().setActivePallete(palleteID: cell.pallete?.getID().uuidString ?? "Could not update the pallete")
            }
        }
        //shape collection
    }
    //number of items in each section of collectionview
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(palletes.count)
        if(self.section == 1) {
            return (palletes.count)
        } else {
            return (shapes?.count) ?? 0
        }
    }
    //filling the collectionView
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (section == 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: boardCollectionCellID, for: indexPath) as! BoardCollectionViewCell
                cell.coinsLabel.text = String(palletes[indexPath.row].getPrice())
                cell.primaryView.backgroundColor = palletes[indexPath.row].getColor(option: .primaryColor)
                cell.secondaryView.backgroundColor = palletes[indexPath.row].getColor(option: .secondaryColor)
                cell.thirdView.backgroundColor = palletes[indexPath.row].getColor(option: .thirdColor)
                cell.fourthView.backgroundColor = palletes[indexPath.row].getColor(option: .fourthColor)
                cell.fifthView.backgroundColor = palletes[indexPath.row].getColor(option: .fifthColor)
                cell.pallete = palletes[indexPath.row]
                if (cell.pallete?.getBoughtState()) == true {
                    cell.coinsLabel.isHidden = true
                    cell.coinImage.isHidden = true
                }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shapeCollectionCellID, for: indexPath) as! ShapeCollectionViewCell
                cell.coinsLabel.text = String(shapes?[indexPath.row].price ?? 0)
                cell.shapeImageView.image = shapes?[indexPath.row].symbol
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
    }
}
