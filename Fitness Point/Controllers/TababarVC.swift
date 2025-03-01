//
//  TababarVC.swift
//  Quotes
//
//  Created by Afnan Ahmed on 12/12/2023.
//

import Foundation
import UIKit

class TabbarVC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        // Create view controllers for each tab
//        let selectedColor   = UIColor(red: 246.0/255.0, green: 155.0/255.0, blue: 13.0/255.0, alpha: 1.0)
//            let unselectedColor = UIColor(red: 16.0/255.0, green: 224.0/255.0, blue: 223.0/255.0, alpha: 1.0)
//
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        
//        custom.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "tab_icon_normal"), selectedImage: UIImage(named: "tab_icon_selected"))
        
        let vc11 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        let vc1 = UINavigationController(rootViewController: vc11)
        vc1.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "TabbarHeart"), tag: 0)
        vc1.tabBarItem.image = UIImage(named: "Home")!.withRenderingMode(.alwaysOriginal)
        vc1.tabBarItem.selectedImage = UIImage(named: "HomeSelected")!.withRenderingMode(.alwaysOriginal)
        
        
        let vc20 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TrainingVC") as! TrainingVC
        let vc2 = UINavigationController(rootViewController: vc20)
        vc2.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "TabbarCategorie"), tag: 1)
        vc2.tabBarItem.image = UIImage(named: "Training")!.withRenderingMode(.alwaysOriginal)
        vc2.tabBarItem.selectedImage = UIImage(named: "TrainingSelected")!.withRenderingMode(.alwaysOriginal)
        
        
        let vc30 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "YogaMusicVC") as! YogaMusicVC
        let vc3 = UINavigationController(rootViewController: vc30)
        vc3.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "TabbarHeart"), tag: 1)
        vc3.tabBarItem.image = UIImage(named: "Yoga")!.withRenderingMode(.alwaysOriginal)
        vc3.tabBarItem.selectedImage = UIImage(named: "YogaSelected")!.withRenderingMode(.alwaysOriginal)

        self.viewControllers = [vc1, vc2, vc3]
        self.tabBar.backgroundColor = AppColors.shared.TabbarColor
        self.tabBar.barTintColor = AppColors.shared.TabbarColor
        let lineView = UIView(frame: CGRect(x: 0, y: -6, width:tabBar.frame.size.width, height: 6))
        lineView.backgroundColor = self.tabBar.backgroundColor
//        tabBar.addSubview(lineView)
        self.delegate = self
    }
}
