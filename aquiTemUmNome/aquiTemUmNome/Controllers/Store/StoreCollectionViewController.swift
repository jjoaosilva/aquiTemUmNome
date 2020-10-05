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
    var shapes = ShapesRepository().readAllItems()
    let boardCollectionCellID = "BoardCollectionViewCellID"
    let shapeCollectionCellID = "ShapeCollectionViewCellID"
    //delegate function
    func buyShapeAction(_ indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ShapeCollectionViewCell
        cell.shape?.setBoughtState(state: true)
        ShapesRepository().update(item: cell.shape!)
        deanimateShapeCollectionView()
        animateShapeCell(cell)
        _ = ShapeManager().setActiveShape(shapeID: cell.shape?.getID().uuidString ?? "Could not update the Shape")
        collectionView.reloadItems(at: [indexPath])
    }
    func buyBoardAction(_ indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! BoardCollectionViewCell
        cell.pallete?.setBoughtState(state: true)
        PallettesRepository().update(item: cell.pallete!)
        deanimateBoardCollectionView()
        animateBoardCell(cell)
        _ = PalletteManager().setActivePallete(palleteID: cell.pallete?.getID().uuidString ?? "Could not update the pallete")
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
            modalBuyBoard.modalPresentationStyle = .overFullScreen
            modalBuyBoard.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            modalBuyBoard.navigationBar.shadowImage = UIImage()
        self.present(modalBuyBoard, animated: true, completion: nil)
    }
    func presentModalShape(_ shape: Shape, indexPath: IndexPath) {
        let viewController = ModalBuyShapeViewController()
        viewController.delegate = self
        viewController.modalBuyShapeView.coinsLabel.text = String(shapes[indexPath.row].getPrice())
        viewController.modalBuyShapeView.shapeImage.image = UIImage(systemName: shapes[indexPath.row].getSymbolName())
        viewController.indexPath = indexPath
        let modalBuyShape = UINavigationController(rootViewController: viewController)
            modalBuyShape.modalPresentationStyle = .overFullScreen
            modalBuyShape.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            modalBuyShape.navigationBar.shadowImage = UIImage()
        self.present(modalBuyShape, animated: true, completion: nil)
    }
    func animateBoardCell(_ cell: BoardCollectionViewCell) {
        cell.addSubview(cell.circle)
        cell.circle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cell.circle.centerXAnchor.constraint(equalTo: cell.roundView.centerXAnchor),
            cell.circle.centerYAnchor.constraint(equalTo: cell.roundView.centerYAnchor),
            cell.circle.heightAnchor.constraint(equalTo: cell.roundView.heightAnchor)
        ])
        cell.circle.completeAnimation(with: 0.5)
    }
    func deanimateBoardCollectionView() {
        for row in 0..<collectionView.numberOfItems(inSection: 0) {
            let cell = collectionView.cellForItem(at: IndexPath(row: row, section: 0)) as! BoardCollectionViewCell
            cell.circle.removeFromSuperview()
        }
    }
    func animateShapeCell(_ cell: ShapeCollectionViewCell) {
        cell.addSubview(cell.circle)
        cell.circle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cell.circle.centerXAnchor.constraint(equalTo: cell.roundView.centerXAnchor),
            cell.circle.centerYAnchor.constraint(equalTo: cell.roundView.centerYAnchor),
            cell.circle.heightAnchor.constraint(equalTo: cell.roundView.heightAnchor)
        ])
        cell.circle.completeAnimation(with: 0.5)
    }
    func deanimateShapeCollectionView() {
        for row in 0..<collectionView.numberOfItems(inSection: 0) {
            let cell = collectionView.cellForItem(at: IndexPath(row: row, section: 0)) as? ShapeCollectionViewCell
            cell?.circle.removeFromSuperview()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(BoardCollectionViewCell.self, forCellWithReuseIdentifier: boardCollectionCellID)
        collectionView.register(ShapeCollectionViewCell.self, forCellWithReuseIdentifier: shapeCollectionCellID)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
    }
    //click on cell
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //pallete collection
        if(self.section == 1) {
            let cell = collectionView.cellForItem(at: indexPath) as! BoardCollectionViewCell
            //this is what happens when the user clicks on a board that wasnt bought yet
            if(cell.pallete!.getBoughtState() == false) {
                //presents the modal
                presentModalBoard(cell.pallete!, indexPath: indexPath)
            } else {
                //animation fill
                deanimateBoardCollectionView()
                animateBoardCell(cell)
                _ = PalletteManager().setActivePallete(palleteID: cell.pallete?.getID().uuidString ?? "Could not update the pallete")
            }
        } else {
        //shape collection
            let cell = collectionView.cellForItem(at: indexPath) as! ShapeCollectionViewCell
            //this is what happens when the user clicks on a shape that wanst bought yet
            if(cell.shape?.getBoughtState() == false) {
                //present buy modal shape
                presentModalShape(cell.shape!, indexPath: indexPath)
            } else {
                //animation fill
                deanimateShapeCollectionView()
                animateShapeCell(cell)
                _ = ShapeManager().setActiveShape(shapeID: cell.shape?.getID().uuidString ?? "Could not update the shape")
            }
        }
    }
    //number of items in each section of collectionview
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(self.section == 1) {
            return (palletes.count)
        } else {
            return (shapes.count)
        }
    }
    //filling the collectionView
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (section == 1) {
            let activePallete = PalletteManager().getActivePallette()
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
                    if(cell.pallete?.getID() == activePallete.getID()) {
                        animateBoardCell(cell)
                    } else {
                        cell.circle.removeFromSuperview()
                    }
                }
            return cell
        } else {
            let activeShape = ShapeManager().getActiveShape()
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shapeCollectionCellID, for: indexPath) as! ShapeCollectionViewCell
            cell.coinsLabel.text = String(shapes[indexPath.row].getPrice())
            cell.shapeImageView.image = UIImage(systemName: shapes[indexPath.row].getSymbolName())
            cell.shape = shapes[indexPath.row]
            if (cell.shape?.getBoughtState() == true) {
                cell.coinsLabel.isHidden = true
                cell.coinImage.isHidden = true
                if(cell.shape?.getID() == activeShape.getID()) {
                    animateShapeCell(cell)
                } else {
                    cell.circle.removeFromSuperview()
                }
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
    }
}
