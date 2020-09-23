//
//  GameScreenViewController.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

// swiftlint:disable line_length

class GameScreenViewController: UIViewController {

    lazy var mainView: GameScreenView = {
        let gameView = GameScreenView()

        let singleTapLeft: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapLeft))
        gameView.leftView.addGestureRecognizer(singleTapLeft)
        gameView.leftView.isUserInteractionEnabled = true

        let singleTapRight: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapRight))
        gameView.rightView.addGestureRecognizer(singleTapRight)
        gameView.rightView.isUserInteractionEnabled = true

        return gameView
    }()

    var boardManager: BoardManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = mainView
    }

    override func viewWillAppear(_ animated: Bool) {
        self.boardManager = BoardManager(screenWidth: self.view.bounds.size.width)
    }

    @objc func tapLeft(recognizer: UITapGestureRecognizer) {
        if recognizer.state == UIGestureRecognizer.State.ended {

            let position = self.boardManager?.moveCharacter(movement: .left, xCurrent: self.mainView.character.frame.origin.x)

            self.mainView.moveCharacter(with: Int(position!))
        }
    }

    @objc func tapRight(recognizer: UITapGestureRecognizer) {
        if recognizer.state == UIGestureRecognizer.State.ended {
            let position = self.boardManager?.moveCharacter(movement: .right, xCurrent: self.mainView.character.frame.origin.x)

            self.mainView.moveCharacter(with: Int(position!))
        }
    }
}
