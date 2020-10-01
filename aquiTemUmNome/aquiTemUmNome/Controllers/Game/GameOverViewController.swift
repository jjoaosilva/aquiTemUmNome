//
//  GameOverViewController.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 29/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    var gameOver = GameOverView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gameOver
        gameOver.homeButton.addTarget(self, action: #selector(self.backMenu), for: .touchUpInside)
        gameOver.restartButton.addTarget(self, action: #selector(self.restartGame), for: .touchUpInside)
    }

    func setupScore(with score: Int) {
        self.gameOver.finalScore.text = "SCORE: \(score)"
    }

    @objc func backMenu() {
        let menuController = UINavigationController(rootViewController: MenuViewController())
        menuController.modalPresentationStyle = .fullScreen
        menuController.isNavigationBarHidden = true
        menuController.modalTransitionStyle = .crossDissolve
        present(menuController, animated: true, completion: nil)
    }

    @objc func restartGame() {
        let restartController = UINavigationController(rootViewController: ReadyViewController())
        restartController.modalPresentationStyle = .fullScreen
        restartController.isNavigationBarHidden = true
        present(restartController, animated: true, completion: nil)
    }
}
