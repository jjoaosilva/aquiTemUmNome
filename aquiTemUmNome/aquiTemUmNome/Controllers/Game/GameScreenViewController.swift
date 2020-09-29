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
        singleTapLeft.numberOfTapsRequired = 1
        singleTapLeft.numberOfTouchesRequired = 1
        gameView.leftView.addGestureRecognizer(singleTapLeft)
        gameView.leftView.isUserInteractionEnabled = true

        let singleTapRight: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapRight))
        singleTapRight.numberOfTapsRequired = 1
        singleTapRight.numberOfTouchesRequired = 1
        gameView.rightView.addGestureRecognizer(singleTapRight)
        gameView.rightView.isUserInteractionEnabled = true

        gameView.delegate = self
        return gameView
    }()

    let queueMove = DispatchQueue(label: "MoveQueue")

    var boardManager: BoardManager?
    lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    var timer: Timer = Timer()
    var isTimerRunning = false

    var score: Int = 0 {
        didSet {
            self.mainView.score.setScore(score: self.score)
            switch score {
            case 0...50:
                self.boardManager?.setDificultt(difficulty: .easy)
            case 51...100:
                self.boardManager?.setDificultt(difficulty: .normal)
            default:
                self.boardManager?.setDificultt(difficulty: .hard)
            }

            self.timeFrame = self.boardManager?.getDificultt().timeFrame ?? 1
        }
    }

    var timeFrame: TimeInterval = 1 {
        didSet {
            self.timer.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: self.timeFrame, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }

    override func viewWillAppear(_ animated: Bool) {
        self.boardManager = BoardManager(screenWidth: self.view.bounds.size.width)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.playTimer()
        isTimerRunning = true
    }

    private func createObstacle() {
        let obstacle = self.boardManager?.getObstacle()
        let width = self.boardManager?.getObstacleWidth()
        let gravity = self.boardManager?.getDificultt().gravity

        self.mainView.createNewObstacle(with: obstacle!.1, set: obstacle!.0, size: width!, animator: self.animator, acceleration: CGFloat(gravity ?? 0.3))
    }

    private func playTimer() {
        if !self.isTimerRunning {
            self.timer = Timer.scheduledTimer(timeInterval: self.timeFrame, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }

    func cancelTimer() {
        timer.invalidate()
        isTimerRunning = false
    }

    @objc func updateTimer() {
        self.createObstacle()
        self.score += 2
    }

    @objc func tapLeft(recognizer: UITapGestureRecognizer) {
//        print(#function)
        print("Fora do tap")
        if recognizer.state == UIGestureRecognizer.State.ended {
            let position = self.boardManager?.moveCharacter(movement: .left, xCurrent: self.mainView.character.frame.origin.x)
            queueMove.sync {
                self.mainView.moveCharacter(with: Int(position!), animator: self.animator)
            }
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
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item1: UIDynamicItem, with item2: UIDynamicItem) {
        self.cancelTimer()
        // TODO - Colocar aqui o push do game over
    }
}
