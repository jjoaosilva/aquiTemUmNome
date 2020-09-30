//
//  ReadyViewController.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 28/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class ReadyViewController: UIViewController {
    lazy var ready: ReadyView = {
       return ReadyView(delegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = ready
    }
}
extension ReadyViewController: AnimatedCircleViewDelegate {
    func didEndAnimation() {
        let duration = 0.40
        self.ready.ready.text = "GO!"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration, execute: { () -> Void in
            let gameController = UINavigationController(rootViewController: GameScreenViewController())
            gameController.modalPresentationStyle = .fullScreen
            gameController.isNavigationBarHidden = true
            gameController.modalTransitionStyle = .crossDissolve
            self.present(gameController, animated: true, completion: nil)

    })
}
}
