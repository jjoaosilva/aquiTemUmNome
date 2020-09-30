//
//  ModalBuyShapeViewController.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 29/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class ModalBuyShapeViewController: UIViewController {
    let modalBuyShapeView = ModalBuyShapeView()
    var indexPath: IndexPath?
    weak var delegate: BuyContentFromStoreDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        modalBuyShapeView.cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        modalBuyShapeView.buyButton.addTarget(self, action: #selector(buyButtonAction), for: .touchUpInside)
        self.view = modalBuyShapeView
        // Do any additional setup after loading the view.
    }
    @objc func cancelButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    @objc func buyButtonAction() {
        delegate?.buyShapeAction(indexPath!)
        dismiss(animated: true, completion: nil)
    }

}
