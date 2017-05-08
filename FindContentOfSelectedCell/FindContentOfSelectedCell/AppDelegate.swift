//
//  AppDelegate.swift
//  FindContentOfSelectedCell
//
//  Created by Joanna Bednarz on 08/05/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // You don't want this code in a release version.
        guard let rootViewController = window?.rootViewController as? ViewController, let preselectedCellIndex = ProcessInfo().environment["CELL_TO_SELECT_INDEX"] else {
            return true
        }
        rootViewController.preselectedCellIndex = Int(preselectedCellIndex)

        return true
    }
}

