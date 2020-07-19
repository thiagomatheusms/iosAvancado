//
//  OnBoardingCollectionViewCell.swift
//  MyGames
//
//  Created by Thiago Matheus on 17/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerDelegate {
    func onBoardingFinished()
}


class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "OnboardingCell"
    
    @IBOutlet weak var pageImage: UIImageView!
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var pageDescription: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var delegate: ViewControllerDelegate!
    
    func fill(with data: OnboardingModel) {
        //        Se quiser imagem no background, descomentar as linhas abaixo
        //        e criar  atributo backgroundImage no OnboardingModel
        //        let backgroundImage = UIImageView(image: UIImage(named: data.backgroundImage))
        //        backgroundImage.contentMode = .scaleAspectFill
        //        backgroundView = backgroundImage
        backgroundColor = data.backgroundColor
        
        pageImage.image = UIImage(named: data.iconImage)
        pageTitle.text = data.title
        pageDescription.text = data.content
        startButton.alpha = data.hideButton ? 0 : 1
        
        startButton.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
    }
    
    
    @objc
    private func buttonPressed() {
        UserDefaults.standard.setValue(true, forKey: "onBoardingFinished")
        delegate.onBoardingFinished()
    }
    
    
}
