//
//  ViewController.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 16/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

// swiftlint:disable line_length unused_optional_binding identifier_name

class ViewController: UIViewController, UICollisionBehaviorDelegate {

    var animator: UIDynamicAnimator!
    var collider: UICollisionBehavior!

    let mainView = VIew()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = mainView
        // Do any additional setup after loading the view.
        let box = UIView(frame: CGRect(x: 100, y: 50, width: 100, height: 100))
        box.backgroundColor = .gray
        view.addSubview(box)

        let ball = UIView(frame: CGRect(x: 50, y: 500, width: 50, height: 50))
        ball.layer.cornerRadius = 25
        ball.backgroundColor = .gray
        view.addSubview(ball)

        animator = UIDynamicAnimator(referenceView: view)
        box.addObstacleAnimation(animator: animator, acceleration: 0.1)
        ball.addMoveBallAnimation(newX: 170, newY: 500)

        collider = ball.addCollisionAnimation(animator: animator, items: [ball, box])
        collider.collisionDelegate = self
    }

    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        print("BATEU \(identifier)")
    }
}
