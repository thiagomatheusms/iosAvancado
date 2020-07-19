//
//  LoginViewController.swift
//  MyGames
//
//  Created by Thiago Matheus on 15/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
   
    //@IBOutlet var containerView: UIView!
    
//    lazy var portraitViewController: UIViewController? = {
//        return UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(identifier: "loginPortrait")
//    }()
//
//    lazy var landscapeViewController: UIViewController? = {
//        return UIStoryboard(name: "SignInLandscape", bundle: nil).instantiateViewController(identifier: "loginLandscape")
//    }()
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        //addChildController(child: portraitViewController)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
//        if newCollection.verticalSizeClass == .regular {
//            addChildController(child: portraitViewController)
//        } else {
//            addChildController(child: landscapeViewController)
//        }
    }
}

private extension LoginViewController {
    
    func addChildController(child: UIViewController?){
        guard let child = child else {
            return
        }
        
        //containerView.addSubview(child.view)
        configureChildConstraints(child: child.view)
        
    }
    
    func configureChildConstraints(child: UIView?){
//        child?.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
//        child?.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
//        child?.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
//        child?.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
      private func configureNavigation() {
          navigationController?.setNavigationBarHidden(true, animated: true)
      }
}

