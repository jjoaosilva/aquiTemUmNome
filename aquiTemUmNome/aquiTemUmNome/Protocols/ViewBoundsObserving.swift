//
//  ViewBoundsObserving.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 28/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

protocol ViewBoundsObservingDelegate: class {
    func boundsWillChange(_ view: UIView)
    func boundsDidChange(_ view: UIView)
}
