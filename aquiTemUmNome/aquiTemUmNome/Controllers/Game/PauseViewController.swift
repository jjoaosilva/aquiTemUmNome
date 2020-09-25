//
//  PauseViewController.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 21/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class PauseViewController: UIViewController {
    let pauseView = PauseView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = pauseView     
        pauseView.muteButton.addTarget(self, action: #selector(self.muteGame), for: .touchUpInside)
        pauseView.homeButton.addTarget(self, action: #selector(self.backMenu), for: .touchUpInside)
        pauseView.playButton.addTarget(self, action: #selector(self.backGame), for: .touchUpInside)
        pauseView.restartButton.addTarget(self, action: #selector(self.restartGame), for: .touchUpInside)
    }
    @objc func backGame() {
        let continueController = UINavigationController(rootViewController: GameScreenViewController())
        continueController.modalPresentationStyle = .fullScreen
        continueController.isNavigationBarHidden = true
        continueController.modalTransitionStyle = .crossDissolve
        present(continueController, animated: true, completion: nil)
    }
    @objc func backMenu() {
        let menuController = UINavigationController(rootViewController: MenuViewController())
        menuController.modalPresentationStyle = .fullScreen
        menuController.isNavigationBarHidden = true
        menuController.modalTransitionStyle = .crossDissolve
        present(menuController, animated: true, completion: nil)
    }
    @objc func muteGame() {
        let status = UserDefaults.standard.bool(forKey: "mute")
        if status {
            UserDefaults.standard.set(false, forKey: "mute")
        } else {
            UserDefaults.standard.set(true, forKey: "mute")
        }
        pauseView.updateMute()
    }
    @objc func restartGame() {
        let restartController = UINavigationController(rootViewController: GameScreenViewController())
        restartController.modalPresentationStyle = .fullScreen
        restartController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        restartController.navigationBar.shadowImage = UIImage()
        present(restartController, animated: true, completion: nil)
    }
}
