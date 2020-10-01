//
//  StoreViewController.swift
//  aquiTemUmNome
//
//  Created by Hiago Chagas on 17/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//  swiftlint:disable force_cast control_statement 

import UIKit

class StoreViewController: UIViewController {
    let storeView = StoreView()
    let palletes = PallettesRepository().readAllItems()
    let shapes = ShapesRepository().readAllItems()
    override func viewDidLoad() {
        super.viewDidLoad()
        storeView.tableView.delegate = self
        storeView.tableView.dataSource = self
        storeView.tableView.bounces = false
        storeView.tableView.separatorStyle = .none
        self.view = storeView
        storeView.backButton.addTarget(self, action: #selector(self.backMenu), for: .touchUpInside)
    }
    @objc func backMenu() {
        let menuController = UINavigationController(rootViewController: MenuViewController())
        menuController.modalPresentationStyle = .fullScreen
        menuController.isNavigationBarHidden = true
        menuController.modalTransitionStyle = .crossDissolve
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(menuController, animated: true, completion: nil)
    }
}
extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: UIView = {
            let view = UIView()
                view.backgroundColor = .clear
                view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            return view
        }()
        let lbl: UILabel = {
            let lbl = UILabel()
                lbl.text = (section % 2 == 0) ? "Shape" : "Board"
                lbl.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            return lbl
        }()
        view.addSubview(lbl)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18).isActive = true
        lbl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        return view
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! StoreTableViewCell
        cell.collectionViewController.section = indexPath.section
        if(indexPath.section == 1) {
            cell.collectionViewController.palletes = palletes
        } else {
            cell.collectionViewController.shapes = shapes
        }
        cell.backgroundColor = .clear
        return cell
    }
}
