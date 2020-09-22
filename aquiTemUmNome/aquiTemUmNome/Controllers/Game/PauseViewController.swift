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
    }
}
