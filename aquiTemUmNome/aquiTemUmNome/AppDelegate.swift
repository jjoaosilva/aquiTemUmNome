//
//  AppDelegate.swift
//  aquiTemUmNome
//
//  Created by José João Silva Nunes Alves on 16/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import UIKit

// swiftlint:disable line_length

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let defaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if UserDefaults.standard.bool(forKey: "First Launch") == false {
            defaults.set(false, forKey: "mute")
            //palletes mockup
            let standardPallette = PallettesRepository().createNewItem(primaryColor: .systemRed, secondaryColor: .systemBlue, thirdColor: .systemOrange, fourthColor: .systemGreen, fifthColor: .magenta, boughtState: true)
            _ = PallettesRepository().createNewItem(primaryColor: .customLightBlue, secondaryColor: .customMossGreen, thirdColor: .customOrange, fourthColor: .customDarkBlue, fifthColor: .customPink)
            //shapes mockup
            let ball = ShapesRepository().createNewItem(name: "Ball", symbol: "circle.fill", price: 50, boughtState: true)
            _ = ShapesRepository().createNewItem(name: "Star", symbol: "star.fill", price: 90)
            _ = ShapesRepository().createNewItem(name: "Shield", symbol: "shield.fill", price: 80)
            _ = ShapesRepository().createNewItem(name: "Hexagon", symbol: "hexagon.fill", price: 70)
            _ = PalletteManager().setActivePallete(palleteID: standardPallette.getID().uuidString)
            _ = ShapeManager().setActiveShape(shapeID: ball.getID().uuidString)
        }
        UserDefaults.standard.set(true, forKey: "First Launch")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        defaults.synchronize()
    }
}
