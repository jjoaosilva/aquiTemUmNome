//
//  AnimatedCircleView.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 18/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

// swiftlint:disable line_length

class AnimatedCircleView: UIView {

    let circle: CAShapeLayer = {
        var circle = CAShapeLayer()
        circle.strokeColor = UIColor.systemYellow.cgColor
        circle.strokeEnd = 1
        circle.lineWidth = 5
        circle.fillColor = UIColor.clear.cgColor
        circle.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        return circle
    }()

    let shadowCircle: CAShapeLayer = {
        var circle = CAShapeLayer()
        circle.strokeColor = UIColor.systemYellow.cgColor
        circle.strokeEnd = 1
        circle.lineWidth = 5
        circle.fillColor = UIColor.clear.cgColor

        circle.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        return circle
    }()

    private var typeAnimation: CircleAnimation = .idle
    private var timeAnimation: Float = 0
    private var colorType: ColorType = .primaryColor
    private var circleColor: ColorType = .primaryColor
    // TODO: pegar cores da persistencia quando estiver feita
    let standardPallette = ColorPallette(primaryColor: .systemRed, secondaryColor: .systemBlue, thirdColor: .systemOrange, fourthColor: .systemGreen, fifthColor: .systemPurple)

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(lineWidth: Int, circleColor: UIColor, shadowColor: UIColor) {
        self.init()

        circle.lineWidth = CGFloat(lineWidth)
        circle.strokeColor = circleColor.cgColor

        shadowCircle.lineWidth = CGFloat(lineWidth)
        shadowCircle.strokeColor = shadowColor.cgColor
    }

    convenience init(lineWidth: Int) {
        self.init()

        circle.lineWidth = CGFloat(lineWidth)
        shadowCircle.lineWidth = CGFloat(lineWidth)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupCircles()
    }

    private func setupCircles() {
        let positionX = self.frame.size.width/2
        let positionY = self.frame.size.height/2

        let path = UIBezierPath(arcCenter: .zero, radius: positionY, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        self.circle.path = path.cgPath
        self.circle.position  = CGPoint(x: positionX, y: positionY)

        self.shadowCircle.path = path.cgPath
        self.shadowCircle.position  = CGPoint(x: positionX, y: positionY)

        self.layer.addSublayer(shadowCircle)
        self.layer.addSublayer(circle)
    }

    private func configureAnimation(fromValue: Float, toValue: Float, duration: CFTimeInterval) -> CABasicAnimation {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = fromValue
        basicAnimation.toValue = toValue
        basicAnimation.duration = duration
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false

        basicAnimation.delegate = self
        return basicAnimation
    }

    private func doAnimation(with duration: Float) {
        let animation = configureAnimation(fromValue: 0, toValue: 1, duration: TimeInterval(duration))

        self.circle.strokeColor = self.standardPallette.getColor(option: self.circleColor).cgColor
        self.circle.add(animation, forKey: "StrokeEnd")
    }

    private func handleColors(circleColor: ColorType, shadowColor: ColorType) {
        self.shadowCircle.strokeColor = standardPallette.getColor(option: shadowColor).cgColor
        self.circleColor = circleColor
    }

    private func configureColors() {
        switch self.colorType {
        case .primaryColor:
            self.handleColors(circleColor: .primaryColor, shadowColor: .fifthColor)
            self.colorType = .secondaryColor
        case .secondaryColor:
            self.handleColors(circleColor: .secondaryColor, shadowColor: .primaryColor)
            self.colorType = .thirdColor
        case .thirdColor:
            self.handleColors(circleColor: .thirdColor, shadowColor: .secondaryColor)
            self.colorType = .fourthColor
        case .fourthColor:
            self.handleColors(circleColor: .fourthColor, shadowColor: .thirdColor)
            self.colorType = .fifthColor
        case .fifthColor:
            self.handleColors(circleColor: .fifthColor, shadowColor: .fourthColor)
            self.colorType = .primaryColor
        }
    }

    func idleStage() {
        self.typeAnimation = .idle
    }

    func completeAnimation(with duration: Float) {
        self.typeAnimation = .complete
        self.doAnimation(with: duration)
    }

    func infinityAnimation(durationPerCycle time: Float) {
        self.typeAnimation = .infinity
        self.timeAnimation = time

        self.configureColors()
        self.doAnimation(with: self.timeAnimation)
    }
}

extension AnimatedCircleView: CAAnimationDelegate {

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {

        switch self.typeAnimation {
        case .complete:
            self.typeAnimation = .idle
            self.timeAnimation = 0
        case .infinity:
            self.configureColors()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.doAnimation(with: self.timeAnimation)
            }
        case .idle:
            return
        }
    }
}
