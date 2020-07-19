//
//  AuthenticationContainerViewController.swift
//  MyGames
//
//  Created by Thiago Matheus on 15/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

final class AuthenticationContainerViewController: UIViewController {
    
    @IBOutlet var containerView: UIView!
    
    lazy var portraitViewController: UIViewController? = {
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "loginPortrait")
    }()
    
    lazy var landscapeViewController: UIViewController? = {
        return UIStoryboard(name: "SignInLandscape", bundle: nil).instantiateViewController(identifier: "loginLandscape")
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        addChildController(child: portraitViewController)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let onBoardingFinished = UserDefaults.standard.bool(forKey: "onBoardingFinished")
        
        if(!onBoardingFinished){
            guard let homeViewController = UIStoryboard(name: "OnBoarding", bundle: nil).instantiateViewController(identifier: "homeId") as? OnboardingCollectionViewController else {
                return
            }
            
            self.present(homeViewController, animated: true)
        }
        
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if newCollection.verticalSizeClass == .regular {
            addChildController(child: portraitViewController)
        } else {
            addChildController(child: landscapeViewController)
        }
    }
}

private extension AuthenticationContainerViewController {
    
    func addChildController(child: UIViewController?){
        guard let child = child else {
            return
        }
        
        containerView.addSubview(child.view)
        configureChildConstraints(child: child.view)
        
    }
    
    func configureChildConstraints(child: UIView?){
        child?.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        child?.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        child?.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        child?.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    private func configureNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

