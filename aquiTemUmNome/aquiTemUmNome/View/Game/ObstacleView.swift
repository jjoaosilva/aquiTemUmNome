//
//  ObstacleView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

class ObstacleView: UIView {

    var cor: UIColor = UIColor()

    weak var boundsDelegate: ViewBoundsObservingDelegate?

    public override var bounds: CGRect {
        willSet {
            boundsDelegate?.boundsWillChange(self)
        }
        didSet {
            print("Y: ", self.frame.origin.y)
            boundsDelegate?.boundsDidChange(self)
        }
    }

    public override var frame: CGRect {
        willSet {
            boundsDelegate?.boundsWillChange(self)
        }
        didSet {
            print("Y: ", frame.origin.y)
            boundsDelegate?.boundsDidChange(self)
        }
    }

    convenience init(cor: UIColor, size: CGFloat) {
        self.init()

        self.cor = cor
        self.backgroundColor = cor
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.frame.size.width = size
        self.frame.size.height = size
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print(#function)
    }
}
