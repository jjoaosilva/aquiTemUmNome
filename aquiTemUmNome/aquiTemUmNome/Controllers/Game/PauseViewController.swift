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
}
