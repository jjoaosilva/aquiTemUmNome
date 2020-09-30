//
//  BuyContentFromStore.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 28/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import Foundation

protocol BuyContentFromStoreDelegate: class {
    func buyBoardAction(_ indexPath: IndexPath)
    func buyShapeAction(_ indexPath: IndexPath)
}
