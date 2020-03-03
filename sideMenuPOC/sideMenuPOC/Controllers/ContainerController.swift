//
//  ContainerController.swift
//  sideMenuPOC
//
//  Created by Vanoshan  Ramdhani on 2020/02/28.
//  Copyright © 2020 Vanoshan  Ramdhani. All rights reserved.
//

import Foundation
import UIKit

class ContainerController: UIViewController {
    
    //  MARK: - Properties
    var menuController : MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    
    // MARK: -  Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool{
        return isExpanded
    }
    
    // MARK: - Handlers
    
    func configureHomeController(){
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
    }
    
    
    func configureMenuController(){
        if menuController == nil{
            //add menu controller here
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    //MARK: - Animations
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?){
        if shouldExpand{
            //show Menu
            UIView.animate(withDuration: 0.3, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
            
        }else{
            //hide the menu
            UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseInOut, animations: {
                        self.centerController.view.frame.origin.x = 0
                  }) { (_) in
                    guard let menuOption = menuOption else {return}
                    self.didSelectMenuOption(menuOption: menuOption)
                  }
        }
        //animateStausBar()
    }
    
    func animateStausBar(){
        UIView.animate(withDuration: 0.3, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.setNeedsStatusBarAppearanceUpdate()
                  }, completion: nil)
    }
    
    //MARK: - Selecting Menu Option
    func didSelectMenuOption(menuOption: MenuOption){
        switch menuOption{
        case .Profile:
            print("Show Profile")
            let controller = ProfileController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        case .Inbox:
            print("Show Inbox")
            let controller = InboxController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        case .Notifications:
            print("Show Notifications")
            let controller = NotificationsController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        case .Settings:
            print("Show Settings")
            let controller = SettingsController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)

        }
    }
}
extension ContainerController: homeControllerDelegate{
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
              
          if !isExpanded{
              configureMenuController()
          }
          
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
