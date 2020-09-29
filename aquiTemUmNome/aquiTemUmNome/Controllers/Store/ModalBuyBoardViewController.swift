//
//  ModalBuyBoardViewController.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 26/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
// swiftlint:disable weak_delegate

import UIKit

class ModalBuyBoardViewController: UIViewController {
    let modalBuyBoardView = ModalBuyBoardView()
    var indexPath: IndexPath?
    weak var delegate: BuyContentFromStoreDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        modalBuyBoardView.cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        modalBuyBoardView.buyButton.addTarget(self, action: #selector(buyButtonAction), for: .touchUpInside)
        self.view = modalBuyBoardView
        // Do any additional setup after loading the view.
    }
    @objc func cancelButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    @objc func buyButtonAction() {
//        storeCollectionVC?.buyAction()
        delegate?.buyAction(indexPath!)
        dismiss(animated: true, completion: nil)
    }
}
