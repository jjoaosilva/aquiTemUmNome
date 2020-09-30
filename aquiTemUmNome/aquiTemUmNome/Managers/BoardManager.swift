//
//  BoardManager.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 22/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import Foundation
import UIKit

// swiftlint:disable line_length

class BoardManager {

    private let screenWidth: CGFloat
    private var xPositions: [CGFloat]
    private var obstacleWidth: CGFloat
    private var dificulty: Difficulty
    var charactersPositions: [CGFloat]
    var position: Int = 2
    var lastPosition: Int = 0

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

            let characterPosition = (leading + obstacleWidth*CGFloat(position + 1))/2 // Calculo dos centros
            charactersPositions.append(characterPosition - (screenWidth*0.1)/2) // Calculo dos centros - desconto do tamano do obstaculo
        }
    }

    private func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }

    func getDificultt() -> Difficulty {
        return self.dificulty
    }

    func setDificultt(difficulty: Difficulty) {
        self.dificulty = difficulty
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
        var randomPosition = Int.random(in: 0...4)

        if lastPosition == randomPosition {
            if randomPosition + 1 > 4 {
                randomPosition -= 1
            } else {
                randomPosition += 1
            }
        }
        lastPosition = randomPosition
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
