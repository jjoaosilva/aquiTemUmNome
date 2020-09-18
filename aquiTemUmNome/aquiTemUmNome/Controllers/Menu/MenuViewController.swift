//
//  MenuViewController.swift
//  aquiTemUmNome
//
//  Created by Larissa Uchoa on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    let menuView = MenuView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = menuView
    }

}
