//
//  ReadyView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 28/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//
// swiftlint:disable
import UIKit

class ReadyView: UIView {

    let circle: AnimatedCircleView = {
        let random = Int.random(in: 1...5)
        let color: UIColor
        switch random{
        case 1:
            color = PalletteManager().getActivePallette().getColor(option: .primaryColor)
        case 2:
            color = PalletteManager().getActivePallette().getColor(option: .secondaryColor)
        case 3:
            color = PalletteManager().getActivePallette().getColor(option: .thirdColor)
        case 4:
            color = PalletteManager().getActivePallette().getColor(option: .fourthColor)
        case 5:
            color = PalletteManager().getActivePallette().getColor(option: .fifthColor)
        default:
            color = .systemTeal
        }
        let circle = AnimatedCircleView(lineWidth: 5, circleColor: color, shadowColor: .clear)
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.completeAnimation(with: 3)
        return circle
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
            circle.widthAnchor.constraint(equalTo: circle.heightAnchor)
   ])
    }
    override func layoutSubviews() {
        addSubview(circle)
        addSubview(ready)
        constraints()
    }
//    setando para passar o delegate quando terminar a animação
    init(delegate: AnimatedCircleViewDelegate) {
        super.init(frame: .zero)
        circle.delegate = delegate
        self.backgroundColor = .systemGray6
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
