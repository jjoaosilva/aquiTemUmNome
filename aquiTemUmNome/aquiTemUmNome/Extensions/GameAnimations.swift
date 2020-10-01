//
//  GameAnimations.swift
//  aquiTemUmNome
//
//  Created by Larissa Uchoa on 22/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

// swiftlint:disable line_length

extension UIView {

    func addObstacleAnimation(animator: UIDynamicAnimator, acceleration: CGFloat) -> UIGravityBehavior {
        var gravityBehavior: UIGravityBehavior!

        gravityBehavior = UIGravityBehavior(items: [self])
        gravityBehavior.setAngle(3.14/2, magnitude: acceleration)
        animator.addBehavior(gravityBehavior)
        
        return gravityBehavior
    }

    func addCollisionAnimation(animator: UIDynamicAnimator, items: [UIView]) -> UICollisionBehavior {

        if items[0].backgroundColor != items[1].backgroundColor {
            var collider: UICollisionBehavior!

            collider = UICollisionBehavior(items: items)
            collider.collisionMode = .items
            collider.translatesReferenceBoundsIntoBoundary = true
            collider.addBoundary(withIdentifier: "ball" as NSCopying, for: UIBezierPath(rect: items[0].frame))
            animator.addBehavior(collider)

            return collider

        } else {
            return UICollisionBehavior()
        }
    }

    func addMoveBallAnimation(newX: Int, newY: Int) {
        UIView.animate(withDuration: 0.2, animations: {
            self.frame = CGRect(origin: CGPoint(x: newX, y: newY), size: CGSize(width: self.frame.width, height: self.frame.height))
        })
    }
}
