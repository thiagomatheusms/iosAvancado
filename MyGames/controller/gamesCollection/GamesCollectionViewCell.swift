//
//  OnBoardingCollectionViewCell.swift
//  MyGames
//
//  Created by Thiago Matheus on 14/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

class GamesCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "OnboardingCell"
    
    @IBOutlet weak var pageImage: UIImageView!
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var pageDescription: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    func fill(with data: Game) {
       
        backgroundColor = UIColor.white
        
        if let image = data.cover as? UIImage {
            pageImage.image = image
        } else {
            pageImage.image = UIImage(named: "noCover")
        }
        
       // pageImage.image = UIImage(named: data.iconImage)
        pageTitle.text = data.title
        pageDescription.text = data.console?.name
        startButton.alpha = 0
        
        startButton.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
    }
    

    @objc
    private func buttonPressed() {
        UserDefaults.standard.setValue(true, forKey: "isSignedIn")
    }
    
    
}
