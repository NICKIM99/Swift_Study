//
//  AppDelegate.swift
//  SimpleMemo1
//
//  Created by cse on 2020. 2. 4..
//  Copyright © 2020년 cse. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:  [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let mainstoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        let newViewController:UIViewController = mainstoryboard.instantiateViewController(withIdentifier: "ViewController")
        let rootVC = UINavigationController(rootViewController: newViewController)
        
        let alarmVC = mainstoryboard.instantiateViewController(withIdentifier: "AlarmDetailVC")
        let alarmNavi = UINavigationController(rootViewController: alarmVC)
        let tabVC = UITabBarController()
        tabVC.viewControllers = [rootVC, alarmNavi]
        window?.rootViewController = tabVC
        
        
        
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (didAllow, error) in
            print(didAllow)
            if !didAllow {
                //let alert UIAlertController.init(title: "확인", message: "설정으로 이동해서 푸시 알람 설정을 확인해주세요", preferredStyle: .alert)
                // self.present(alert, animated: true, completion: nil)
            }
        }
        
        //푸시 함수 델리게이트 설정
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
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
//푸시 알림 관련 메소드 구현
extension AppDelegate:UNUserNotificationCenterDelegate {
    //앱이 켜져 있을 때 푸시 메시지 표시하기 위해 사용
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    // 앱이 꺼져 있을 때, 푸시를 통한 앱 기능 설정
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == UNNotificationDismissActionIdentifier{
            print("Message Closed")
        }
        else if response.actionIdentifier == UNNotificationDefaultActionIdentifier{
            print("푸시 메시지 클릭 했을 때")
        }
        completionHandler()
    }
}






