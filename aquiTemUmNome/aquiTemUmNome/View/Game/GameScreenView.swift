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
    let character = CharacterView.init(cor: .cyan)
    let obstacle = ObstacleView.init(cor: .green)
    let score = ScoreView()
    let pause = UIButton(nameIcon: "pause.fill", sizeButton: 42, sizeIcon: 22, weightIcon: .bold, backgroundColor: .clear, tintColor: .label)
    override init(frame: CGRect) {
        super.init(frame: frame)
        character.translatesAutoresizingMaskIntoConstraints = false
        obstacle.translatesAutoresizingMaskIntoConstraints = false
        score.translatesAutoresizingMaskIntoConstraints = false
        pause.translatesAutoresizingMaskIntoConstraints = false
        pause.layer.borderWidth = 4
        pause.layer.borderColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //        Adicionar a view
        addSubview(pause)
        addSubview(score)
        addSubview(character)
        addSubview(obstacle)
        //        constraints character
        character.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        character.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -63).isActive = true
        character.heightAnchor.constraint(equalToConstant: 37).isActive = true
        character.widthAnchor.constraint(equalToConstant: 37).isActive = true
        //
        score.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        score.topAnchor.constraint(equalTo: self.topAnchor, constant: 34).isActive = true
        score.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        //
        pause.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        pause.topAnchor.constraint(equalTo: self.topAnchor, constant: 34).isActive = true
        pause.heightAnchor.constraint(equalToConstant: pause.bounds.size.height).isActive = true
        pause.widthAnchor.constraint(equalToConstant: pause.bounds.size.width).isActive = true
        //        constraints obstacle
        obstacle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        obstacle.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -300).isActive = true
        obstacle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -435).isActive = true
        obstacle.heightAnchor.constraint(equalToConstant: 75).isActive = true
        obstacle.widthAnchor.constraint(equalToConstant: 75).isActive = true
        self.backgroundColor = .systemBackground
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
