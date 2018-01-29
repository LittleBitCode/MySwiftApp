//
//  AppDelegate.swift
//  MySwiftApp
//
//  Created by 郑超华 on 2018/1/29.
//  Copyright © 2018年 郑超华. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        window?.backgroundColor = UIColor.white
        
        let homeVC = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
//        let nav = UINavigationController.init(rootViewController: homeVC)
        if launchOptions != nil {
            let tab = ExampleProvider.customIrregularityStyle(delegate: self)
            window?.rootViewController = tab
        }else {
            let adVC = LBLaunchAdVC.init(defaultDuration: 5, completion: {
                let tab = ExampleProvider.customIrregularityStyle(delegate: self)
                self.window?.rootViewController = tab
            })
            //2 秒之后执行
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                let url = "http://chatm-icon.oss-cn-beijing.aliyuncs.com/pic/pic_20170724152928869.gif"
                let adDuartion = 5
                adVC.setAdParams(url: url, adDuartion: adDuartion, skipBtnType: .circle, adViewBottomDistance: 100, transitionType: .filpFromLeft, adImgViewClick: {
                    //点击广告进行的操作
                    let vc = UIViewController()
                    vc.view.backgroundColor = UIColor.yellow
                    self.window?.rootViewController = vc
                })
            })
            window?.rootViewController = adVC
        }
        window?.makeKeyAndVisible()
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

