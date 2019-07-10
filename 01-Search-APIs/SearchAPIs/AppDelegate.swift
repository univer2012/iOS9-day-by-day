//
//  AppDelegate.swift
//  SearchAPIs
//
//  Created by Chris Grant on 18/06/2015.
//  Copyright © 2015 Scott Logic Ltd. All rights reserved.
//

import UIKit
import CoreSpotlight

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // Find the ID from the user info
        let friendID = userActivity.userInfo?["kCSSearchableItemActivityIdentifier"] as! String
        
        // Find the root table view controller and make it show the friend with this ID.
        let navigationController = (window?.rootViewController as! UINavigationController)
        navigationController.popToRootViewController(animated: false)
        let friendTableViewController = navigationController.viewControllers.first as! FriendTableViewController
        friendTableViewController.showFriend(id: friendID)
        
        return true
    }
}
