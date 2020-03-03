//
//  NotificationsController.swift
//  sideMenuPOC
//
//  Created by Vanoshan  Ramdhani on 2020/03/02.
//  Copyright © 2020 Vanoshan  Ramdhani. All rights reserved.
//
import Foundation
import UIKit

class NotificationsController: UIViewController {
    //MARK: - Properties
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: -Selectors
    
    @objc func handleDismiss(){
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Functions
    func configureUI(){
        view.backgroundColor = .darkGray
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Notifications"
        navigationController?.navigationBar.barStyle = .black
        navigationController?.modalPresentationStyle = .fullScreen

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_clear_white_36pt_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
}
