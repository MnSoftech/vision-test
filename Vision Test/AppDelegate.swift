//
//  AppDelegate.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 06/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var myInterstitial1 : GADInterstitial?
    var myInterstitial2 : GADInterstitial?
    var myInterstitial3 : GADInterstitial?
    var myInterstitial4 : GADInterstitial?
    var myInterstitial5 : GADInterstitial?
    var myInterstitial6 : GADInterstitial?
    var myInterstitial7 : GADInterstitial?
    var myInterstitial8 : GADInterstitial?
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GADMobileAds.configure(withApplicationID: "ca-app-pub-9715580163444023~2584948043")
        myInterstitial1 = createAndLoadInterstitial()
        myInterstitial2 = createAndLoadInterstitial()
        myInterstitial3 = createAndLoadInterstitial()
        myInterstitial4 = createAndLoadInterstitial()
        myInterstitial5 = createAndLoadInterstitial()
        myInterstitial6 = createAndLoadInterstitial()
        myInterstitial7 = createAndLoadInterstitial()
        myInterstitial8 = createAndLoadInterstitial()
        
        return true
    }
    
    func createAndLoadInterstitial()->GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-9715580163444023/8491880845")
        interstitial.delegate = self as? GADInterstitialDelegate
        interstitial.load(GADRequest())
        return interstitial
    }

    func interstitialDidReceiveAd(ad: GADInterstitial!) {
        print("interstitialDidReceiveAd")
    }
    
    func interstitial(ad: GADInterstitial!, didFailToReceiveAdWithError error: GADRequestError!) {
        print(error.localizedDescription)
    }
    
    func interstitialDidDismissScreen(ad: GADInterstitial!) {
        print("interstitialDidDismissScreen")
        myInterstitial1 = createAndLoadInterstitial()
        myInterstitial2 = createAndLoadInterstitial()
        myInterstitial3 = createAndLoadInterstitial()
        myInterstitial4 = createAndLoadInterstitial()
        myInterstitial5 = createAndLoadInterstitial()
        myInterstitial6 = createAndLoadInterstitial()
        myInterstitial7 = createAndLoadInterstitial()
        myInterstitial8 = createAndLoadInterstitial()


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

