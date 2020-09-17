//
//  GameScreenView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class GameScreenView: UIView {
    let character = CharacterView()
    let obstacle = ObstacleView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        character.translatesAutoresizingMaskIntoConstraints = false
        obstacle.translatesAutoresizingMaskIntoConstraints = false

//        Adicionar a view
        addSubview(character)
        addSubview(obstacle)
//        constraints character
        character.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 169).isActive = true
        character.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -169).isActive = true
        character.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -63).isActive = true
        character.heightAnchor.constraint(equalToConstant: 37).isActive = true
        character.widthAnchor.constraint(equalToConstant: 37).isActive = true
//        constraints obstacle
        obstacle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        obstacle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -300).isActive = true
        obstacle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -435).isActive = true
        obstacle.heightAnchor.constraint(equalToConstant: 75).isActive = true
        obstacle.widthAnchor.constraint(equalToConstant: 75).isActive = true
        self.backgroundColor = .systemBackground
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
