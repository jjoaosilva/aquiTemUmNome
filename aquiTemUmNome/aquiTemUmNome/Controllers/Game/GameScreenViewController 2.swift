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

    var boardManager: BoardManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = mainView
    }

    override func viewWillAppear(_ animated: Bool) {
        self.boardManager = BoardManager(screenWidth: self.view.bounds.size.width)
    }
}
