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
    let musicManager = MusicManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        menuView.playButton.addTarget(self, action: #selector(self.playGame), for: .touchUpInside)
        menuView.muteButton.addTarget(self, action: #selector(self.muteGame), for: .touchUpInside)
        menuView.gameCenterButton.addTarget(self, action: #selector(self.gameCenter), for: .touchUpInside)
        menuView.storeButton.addTarget(self, action: #selector(self.storeButton), for: .touchUpInside)

        self.view = menuView
        musicManager.playIntro()
    }
    @objc func playGame() {
        let readyController = UINavigationController(rootViewController: ReadyViewController())
        readyController.modalPresentationStyle = .fullScreen
        readyController.isNavigationBarHidden = true
        readyController.modalTransitionStyle = .crossDissolve
        present(readyController, animated: true, completion: nil)
    }
    @objc func muteGame() {
        let status = UserDefaults.standard.bool(forKey: "mute")
        if status {
            UserDefaults.standard.set(false, forKey: "mute")
        } else {
            UserDefaults.standard.set(true, forKey: "mute")
        }
        menuView.updateMuteButton()
        musicManager.playIntro()
    }

    @objc func gameCenter() {
        // Go To Game Center
    }

    @objc func storeButton() {
        let storeController = UINavigationController(rootViewController: StoreViewController())
        storeController.modalPresentationStyle = .fullScreen
        storeController.isNavigationBarHidden = true
        storeController.modalTransitionStyle = .crossDissolve
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(storeController, animated: true, completion: nil)
    }
}
