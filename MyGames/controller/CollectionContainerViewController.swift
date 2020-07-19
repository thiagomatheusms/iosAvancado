//
//  CollectionContainerViewController.swift
//  MyGames
//
//  Created by Thiago Matheus on 17/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

final class CollectionContainerViewController: UIViewController {
    
     @IBOutlet var containerView: UIView!
        
        lazy var portraitViewController: UIViewController? = {
            return UIStoryboard(name: "GamesCollectionView", bundle: nil).instantiateViewController(identifier: "collectionPortrait")
        }()
        
        lazy var landscapeViewController: UIViewController? = {
            return UIStoryboard(name: "GamesCollectionLaunchScreen", bundle: nil).instantiateViewController(identifier: "collectionLandscape")
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            configureNavigation()
            addChildController(child: portraitViewController)
        
        }
        
        override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
            if newCollection.verticalSizeClass == .regular {
                addChildController(child: portraitViewController)
            } else {
                addChildController(child: landscapeViewController)
            }
        }
    }

    private extension CollectionContainerViewController {
        
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
