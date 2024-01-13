//
//  AppDelegate.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 13.01.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   
    @available(iOS 13.0, *)
    func customNavBarAppearance() -> UINavigationBarAppearance {
    
        let customNavBarAppearance = UINavigationBarAppearance()
        customNavBarAppearance.backgroundColor = R.Colors.green
        return customNavBarAppearance
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        UIFont.familyNames.forEach { name in
//            for font_name in UIFont.fontNames(forFamilyName: name){
//                print("\n\(font_name)")
//            }
//        }
        
        let newNavBarAppearance = customNavBarAppearance()
        let appearance = UINavigationBar.appearance()
        appearance.scrollEdgeAppearance = newNavBarAppearance
        appearance.compactAppearance = newNavBarAppearance
        appearance.standardAppearance = newNavBarAppearance
        if #available(iOS 15.0, *) {
            appearance.compactScrollEdgeAppearance = newNavBarAppearance
        }
        return true
    }
    
}

