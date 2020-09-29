//
//  GameScreenViewController.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class GameScreenViewController: UIViewController {
    let gameView = GameScreenView()

    var boardManager: BoardManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.pause.addTarget(self, action: #selector(pauseGame), for: .touchUpInside)
        self.view = gameView
    }

    @objc func pauseGame() {
        let pauseController = UINavigationController(rootViewController: PauseViewController())
        pauseController.modalPresentationStyle = .overFullScreen
        pauseController.isNavigationBarHidden = true
        present(pauseController, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.boardManager = BoardManager(screenWidth: self.view.bounds.size.width)
    }
}
