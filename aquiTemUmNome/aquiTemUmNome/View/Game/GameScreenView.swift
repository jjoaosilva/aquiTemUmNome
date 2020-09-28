//
//  GameScreenView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//
// swiftlint:disable line_length

import UIKit

class GameScreenView: UIView {
    lazy var character: CharacterView = {
        let charView = CharacterView(cor: .cyan, screenWidth: self.bounds.size.width)
        charView.translatesAutoresizingMaskIntoConstraints = false
        return charView
    }()

//    lazy var obstacle: ObstacleView = {
//        let obstacle = ObstacleView(cor: .gray, screenWidth: self.bounds.size.width)
//        obstacle.translatesAutoresizingMaskIntoConstraints = false
//        return obstacle
//    }()

    let score: ScoreView = {
        let scoreView = ScoreView()
        scoreView.translatesAutoresizingMaskIntoConstraints = false
        return scoreView
    }()

    let pause: UIButton = {
        let button = UIButton(nameIcon: "pause.fill", sizeButton: 42, sizeIcon: 22, weightIcon: .bold, backgroundColor: .clear, tintColor: .label)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var collider: UICollisionBehavior = UICollisionBehavior()

    override func layoutSubviews() {
        super.layoutSubviews()

        self.addSubviews()
        self.setupScoreConstraints()
        self.setupPauseConstraints()
        self.setupTapViewsConstraints()
        self.setupCharacterPosition()
//        self.setupObstaclePosition()
    }

    private func addSubviews() {
        self.addSubview(self.leftView)
        self.addSubview(self.rightView)
        self.addSubview(self.pause)
        self.addSubview(self.score)
        self.addSubview(self.character)

//        self.addSubview(self.obstacle)
    }

    private func setupScoreConstraints() {
        NSLayoutConstraint.activate([
            self.score.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.score.topAnchor.constraint(equalTo: self.topAnchor, constant: 34),
            self.score.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100)
        ])
    }

    private func setupPauseConstraints() {
        self.pause.layer.borderWidth = 4
        self.pause.layer.borderColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)

        NSLayoutConstraint.activate([
            self.pause.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.pause.topAnchor.constraint(equalTo: self.topAnchor, constant: 34),
            self.pause.heightAnchor.constraint(equalToConstant: self.pause.bounds.size.height),
            self.pause.widthAnchor.constraint(equalToConstant: self.pause.bounds.size.width)
        ])
    }

    private func setupTapViewsConstraints() {
        NSLayoutConstraint.activate([
            self.leftView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.leftView.topAnchor.constraint(equalTo: self.topAnchor),
            self.leftView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.leftView.widthAnchor.constraint(equalToConstant: self.bounds.size.width/2),

            self.rightView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.rightView.topAnchor.constraint(equalTo: self.topAnchor),
            self.rightView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.rightView.leftAnchor.constraint(equalTo: self.leftView.rightAnchor)
        ])
    }

    private func setupCharacterPosition() {
        let xPosition = self.bounds.size.width/2 - self.character.bounds.size.width/2
        let yPosition = self.bounds.size.height - self.bounds.size.height*0.05 - self.character.bounds.size.width
        self.character.frame = CGRect(x: xPosition, y: yPosition, width: self.character.bounds.size.width, height: self.character.bounds.size.height)
    }

    func createNewObstacle(with color: UIColor, set position: CGFloat, size: CGFloat, animator: UIDynamicAnimator, acceleration: CGFloat) {
        let obstacle = ObstacleView(cor: color, size: size)
        obstacle.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(obstacle)
        obstacle.frame = CGRect(x: position, y: -size, width: size, height: size)
        obstacle.addObstacleAnimation(animator: animator, acceleration: acceleration)
        self.collider = self.character.addCollisionAnimation(animator: animator, items: [self.character, obstacle])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameScreenView {
    func moveCharacter(with xPosition: Int, animator: UIDynamicAnimator) {
        
        let yPosition = self.bounds.size.height - self.bounds.size.height*0.05 - self.character.bounds.size.width
        
        self.character.addMoveBallAnimation(newX: xPosition, newY: Int(yPosition))
    }
}
