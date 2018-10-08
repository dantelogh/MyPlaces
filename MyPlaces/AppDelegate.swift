//
//  AppDelegate.swift
//  MyPlaces
//
//  Created by user143004 on 10/1/18.
//  Copyright © 2018 user143004. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //NOTA: Método modificado para la PLA 1
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let manager = ManagerPlaces.shared()
        //Items de prueba para visualizarlos en la lista (FirstViewController)
        //y en la vista detalle (DetailController)
        let place_1 = Place(name: "Test Place 1", description: "More Info 1", image_in: nil)
        let place_2 = Place(name: "Test Place 2", description: "More Info 2", image_in: nil)
        let place_3 = Place(name: "Test Place 3", description: "More Info 3", image_in: nil)
        let place_4 = Place(name: "Test Place 4", description: "More Info 4", image_in: nil)
        
        manager.append(place_1)
        manager.append(place_2)
        manager.append(place_3)
        manager.append(place_4)
        //print("Hola")

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

