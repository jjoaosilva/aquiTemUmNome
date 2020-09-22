//
//  GameScreenViewController.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class GameScreenViewController: UIViewController {
    let mainView = GameScreenView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = mainView
}
}
