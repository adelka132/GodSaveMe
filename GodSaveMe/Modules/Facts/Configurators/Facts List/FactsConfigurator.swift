//
//  FactsConfigurator.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 14/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import Foundation

final class FactsConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? FactsViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: FactsViewController) {

        let presenter = FactsPresenter(with: .factsList)
        presenter.view = viewController
        
        let interactor = FactsInteractor()
        interactor.output = presenter
        presenter.interactor = interactor
        
        viewController.output = presenter
    }
}
