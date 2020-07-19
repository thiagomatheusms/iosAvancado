//
//  OnBoardingModelFactory.swift
//  MyGames
//
//  Created by Thiago Matheus on 17/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import Foundation
import UIKit

class OnboardingModelFactory {

    static func getPages() -> [OnboardingModel] {
        return [
            OnboardingModel(title: "Bem vindo ao TODO List",
                            content: "Cadastre suas tarefas diárias e tenha controle sobre seu dia.",
                            iconImage: "iconOnboarding1",
                            backgroundColor: UIColor.cyan,
                            hideButton: true),

            OnboardingModel(title: "Você que manda",
                            content: "Edite e exclua tarefas a qualquer momento.",
                            iconImage: "iconOnboarding2",
                            backgroundColor: UIColor.blue,
                            hideButton: true),

            OnboardingModel(title: "Tudo pronto",
                            content: "Agora que você já entendeu como funciona, prossiga para o principal.",
                            iconImage: "iconOnboarding3",
                            backgroundColor: UIColor.green,
                            hideButton: false)
        ]
    }

}
