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
//    let pauseView = PauseView()

    var boardManager: BoardManager?
//    var effect: UIVisualEffect!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gameView
        gameView.pause.addTarget(self, action: #selector(self.pauseGame), for: .touchUpInside)
//        effect = pauseView.blur.effect
    }
//    func animateIn() {
//        pauseView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
//        pauseView.alpha = 0
//            UIView.animate(withDuration: 0.4) {
//                self.pauseView.blur.effect = self.effect
//                self.pauseView.blur.alpha = 1
//                self.pauseView.blur.transform = CGAffineTransform.identity
//            }
//        }
    @objc func pauseGame() {
//        animateIn()
        let pauseController = UINavigationController(rootViewController: PauseViewController())
        pauseController.modalPresentationStyle = .fullScreen
        pauseController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        pauseController.navigationBar.shadowImage = UIImage()
        present(pauseController, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.boardManager = BoardManager(screenWidth: self.view.bounds.size.width)
    }
}
