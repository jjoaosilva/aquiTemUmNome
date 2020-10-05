//
//  ScoreView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 18/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class ScoreView: UIView {

    let scoreName: UILabel = {
        let scoreName = UILabel()
        scoreName.textAlignment = .center
        scoreName.text = "SCORE"
        scoreName.textColor = .label
        scoreName.translatesAutoresizingMaskIntoConstraints = false
        scoreName.font = .systemFont(ofSize: 29, weight: .semibold)

        return scoreName
    }()

    let score: UILabel = {
        let score = UILabel()
        score.textAlignment = .center
        score.textColor = .label
        score.font = .systemFont(ofSize: 29, weight: .semibold)
        score.text = "0"
        score.translatesAutoresizingMaskIntoConstraints = false

        return score
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubViews()
        self.setupConstraints()
    }

    private func addSubViews() {
        addSubview(scoreName)
        addSubview(score)
    }

    private func setupConstraints() {
        scoreName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        scoreName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        scoreName.widthAnchor.constraint(greaterThanOrEqualToConstant: 76).isActive = true
        score.topAnchor.constraint(equalTo: scoreName.bottomAnchor, constant: 2).isActive = true
        score.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setScore(score: Int) {
        self.score.text = String(score)
    }
}
