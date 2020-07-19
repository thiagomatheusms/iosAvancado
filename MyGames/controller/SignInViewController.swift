//
//  SignInViewController.swift
//  MyGames
//
//  Created by Thiago Matheus on 15/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//


import UIKit

final class SignInViewController: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet var container: UIView!
    
    var authentication = AuthenticationContainerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
        configureLeading()
        
        
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        print("aqui")

        
    }
}

// MARK: Configuration methods
extension SignInViewController {
    
    private func configureButton() {
        signInButton.layer.cornerRadius = 4
    }
    
    
    
    private func configureLeading(){
        container.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 8).isActive = true

    }
    
}
