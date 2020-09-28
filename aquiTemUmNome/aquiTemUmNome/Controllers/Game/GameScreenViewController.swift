//
//  GameScreenViewController.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

// swiftlint:disable line_length identifier_name

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
    lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = mainView
    }

    override func viewWillAppear(_ animated: Bool) {
        self.boardManager = BoardManager(screenWidth: self.view.bounds.size.width)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.mainView.collider.collisionDelegate = self
        self.createObstacle()
    }

    private func createObstacle() {
        let obstacle = self.boardManager?.getObstacle()
        let width = self.boardManager?.getObstacleWidth()
        let gravity = self.boardManager?.getDificultt().gravity

        self.mainView.createNewObstacle(with: obstacle!.1, set: obstacle!.0, size: width!, animator: self.animator, acceleration: CGFloat(gravity ?? 0.3))
    }

    @objc func tapLeft(recognizer: UITapGestureRecognizer) {
        if recognizer.state == UIGestureRecognizer.State.ended {

            let position = self.boardManager?.moveCharacter(movement: .left, xCurrent: self.mainView.character.frame.origin.x)

            self.mainView.moveCharacter(with: Int(position!), animator: self.animator)
        }
    }

    @objc func tapRight(recognizer: UITapGestureRecognizer) {
        if recognizer.state == UIGestureRecognizer.State.ended {
            let position = self.boardManager?.moveCharacter(movement: .right, xCurrent: self.mainView.character.frame.origin.x)

            self.mainView.moveCharacter(with: Int(position!), animator: self.animator)
        }
    }
}

extension GameScreenViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        print("BATEU \(identifier)")
    }
}
