//
//  DetailConfigurator.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 18/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import Foundation

final class DetailConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? DetailViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: DetailViewController) {
        
        let presenter = DetailPresenter()
        presenter.view = viewController
        
        let interactor = DetailInteractor()
        interactor.output = presenter
        presenter.interactor = interactor
        
        viewController.output = presenter
    }
}
