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

        menuView.muteButton.addTarget(self, action: #selector(self.muteGame), for: .touchUpInside)
        menuView.gameCenterButton.addTarget(self, action: #selector(self.gameCenter), for: .touchUpInside)
        menuView.storeButton.addTarget(self, action: #selector(self.storeButton), for: .touchUpInside)

        self.view = menuView
    }

    @objc func muteGame() {
        let status = UserDefaults.standard.bool(forKey: "mute")
        if status {
            UserDefaults.standard.set(false, forKey: "mute")
        } else {
            UserDefaults.standard.set(true, forKey: "mute")
        }
        menuView.updateMuteButton()
    }

    @objc func gameCenter() {
        // Go To Game Center
    }

    @objc func storeButton() {
        // Go To Store
    }
}
