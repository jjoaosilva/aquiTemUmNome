//
//  ReadyViewController.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 28/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class ReadyViewController: UIViewController {
    let ready = ReadyView()
    override func viewDidLoad() {
        super.viewDidLoad()
        ready.circle.delegate = self
        self.view = ready
    }
}
extension ReadyViewController: AnimatedCircleViewDelegate {
    func didEndAnimation() {
        let delay = 3.0
        let duration = 0.25
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: { () -> Void in
            self.ready.ready.text = "GO!"
//            UIView.animate(withDuration: duration, animations: { () -> Void in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration, execute: { () -> Void in
            let gameController = UINavigationController(rootViewController: GameScreenViewController())
            gameController.modalPresentationStyle = .fullScreen
            gameController.isNavigationBarHidden = true
            gameController.modalTransitionStyle = .crossDissolve
            self.present(gameController, animated: true, completion: nil)

    })
        }
    )
    }
}
