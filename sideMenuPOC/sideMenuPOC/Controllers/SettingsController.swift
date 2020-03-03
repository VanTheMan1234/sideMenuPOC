//
//  SettingsController.swift
//  sideMenuPOC
//
//  Created by Vanoshan  Ramdhani on 2020/03/02.
//  Copyright © 2020 Vanoshan  Ramdhani. All rights reserved.
//

import Foundation
import UIKit

class SettingsController: UIViewController {
    //MARK: - Properties
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .green
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        self.view.addSubview(button)
        
    }
    
    //MARK: -Selectors
    
    @objc func buttonAction(sender: UIButton!) {
      print("Button tapped")
        let navController = UINavigationController(rootViewController: ProfileController()) // Creating a navigation controller with VC1 at the root of the navigation stack.
        self.present(navController, animated:true, completion: nil)  
    }
    
    @objc func handleDismiss(){
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Functions
    func configureUI(){
        view.backgroundColor = .darkGray
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        navigationController?.navigationBar.barStyle = .black
        navigationController?.modalPresentationStyle = .fullScreen
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_clear_white_36pt_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
}
