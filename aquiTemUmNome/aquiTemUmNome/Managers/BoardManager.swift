//
//  BoardManager.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 22/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import Foundation
import UIKit

class BoardManager {

    private let screenWidth: CGFloat
    private var xPositions: [CGFloat]
    private var obstacleWidth: CGFloat
    private var dificulty: Difficulty
    private var charactersPositions: [CGFloat]
    private var position: Int = 2

    // TODO: pegar cores da persistencia quando estiver feita
    let standardPallette = ColorPallette(primaryColor: .systemRed, secondaryColor: .systemBlue, thirdColor: .systemOrange, fourthColor: .systemGreen, fifthColor: .systemPurple)

    init(screenWidth: CGFloat) {
        self.screenWidth = screenWidth
        self.obstacleWidth = screenWidth/5
        self.xPositions = [CGFloat]()
        self.charactersPositions = [CGFloat]()
        self.dificulty = .easy

        for position in 0...4 {
            let leading = CGFloat(position) * self.obstacleWidth
            xPositions.append(leading)

            let characterPosition = (leading + obstacleWidth)/2
            charactersPositions.append(characterPosition)
        }
    }

    private func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }

    func getDificultt() -> Difficulty {
        return self.dificulty
    }

    func getObstacleWidth() -> CGFloat {
        return self.obstacleWidth
    }

    func getObstacleHeigth() -> CGFloat {
        return self.obstacleWidth
    }

    func getxPositions() -> [CGFloat] {
        return self.xPositions
    }

    func getRandomPosition() -> CGFloat {
        let randomPosition = Int.random(in: 0...4)

        return self.xPositions[randomPosition]
    }

    func getRandomColor() -> UIColor {
        let randomPosition = Int.random(in: 0...4)
        let colorType = ColorType(rawValue: randomPosition)

        guard let unwrappedColorType = colorType else {
            return standardPallette.getColor(option: .primaryColor)
        }
        return standardPallette.getColor(option: unwrappedColorType)
    }

    func getObstacle() -> (CGFloat, UIColor) {
        let position = self.getRandomPosition()
        let color = self.getRandomColor()

        return (position, color)
    }

    func getSwitchColorObstacle() -> (CGFloat, UIImage) {
        let position = self.getRandomPosition()
        let image = UIImage(named: "switchColor")

        return (position, image!)
    }

    func choiceFunction() -> ObstacleType {
        let randomNumber = Int.random(in: 3...100)

        return self.isPrime(randomNumber) ? .switchColor : .regular
    }

    func manageDificulty(with score: Int) {
        switch score {
        case 0...50:
            self.dificulty = .easy
        case 51...150:
            self.dificulty = .normal
        default:
            self.dificulty = .hard
        }
    }

    func moveCharacter(movement: Movement, xCurrent: CGFloat) -> CGFloat {
        switch movement {
        case .left:
            let newPosition = position - 1
            if newPosition >= 0 {
                position = newPosition
            }
        case .right:
            let newPosition = position + 1

            if newPosition <= 4 {
                position = newPosition
            }
        }
        return charactersPositions[position]
    }
}
