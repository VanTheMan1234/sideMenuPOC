//
//  HomeController.swift
//  sideMenuPOC
//
//  Created by Vanoshan  Ramdhani on 2020/02/28.
//  Copyright © 2020 Vanoshan  Ramdhani. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    let tabBarCnt = UITabBarController()
    //  MARK: - Properties
    var delegate: homeControllerDelegate?
    
    // MARK: -  Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        createTabBarController()
        view.backgroundColor = .white
    }
    // MARK: - Handlers
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle(forMenuOption: nil)
        print("toggle")
        
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "SideMenu"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    func createTabBarController() {
        
     let firstVc = SettingsController()
             firstVc.title = "First"
             firstVc.view.backgroundColor =  UIColor.red
             firstVc.tabBarItem = UITabBarItem.init(title: "Email", image: UIImage(named: "ic_mail_outline_white_2x"), tag: 0)
             
             let secondVc = UIViewController()
             secondVc.title = "Second"
             secondVc.view.backgroundColor =  UIColor.green
             secondVc.tabBarItem = UITabBarItem.init(title: "Individual", image: UIImage(named: "ic_person_outline_white_2x"), tag: 1)

             let controllerArray = [firstVc, secondVc]
             tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
             
             self.view.addSubview(tabBarCnt.view)
       }
}
