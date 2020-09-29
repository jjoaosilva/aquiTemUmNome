//
//  ReadyView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 28/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//
// swiftlint:disable line_length
import UIKit

class ReadyView: UIView {

    let circle: AnimatedCircleView = {
        let circle = AnimatedCircleView(lineWidth: 5, circleColor: .systemPink, shadowColor: .clear);      circle.translatesAutoresizingMaskIntoConstraints = false
        circle.completeAnimation(with: 3)
        return circle
    }()
    let character: CharacterView = {
        let character = CharacterView.init(cor: .cyan)
        character.translatesAutoresizingMaskIntoConstraints = false
        return character
    }()
    let ready: UILabel = {
        let ready = UILabel()
        ready.text = "Ready?"
        ready.tintColor = .label
        ready.font = .systemFont(ofSize: 32, weight: .bold)
        ready.translatesAutoresizingMaskIntoConstraints = false
        return ready
    }()
    func constraints() {
        NSLayoutConstraint.activate([
            ready.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ready.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            circle.centerXAnchor.constraint(equalTo: ready.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: ready.centerYAnchor),
            circle.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            circle.widthAnchor.constraint(equalTo: circle.heightAnchor),
            character.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            character.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -33),
            character.heightAnchor.constraint(equalToConstant: character.bounds.size.height),
            character.widthAnchor.constraint(equalToConstant: character.bounds.size.width)
   ])
    }
    override func layoutSubviews() {
        addSubview(circle)
        addSubview(ready)
        addSubview(character)
        constraints()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
