//
//  FavouriteInitializer.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 15/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import Foundation

final class FavouriteInitializer: NSObject {
    
    @IBOutlet private weak var favouriteViewController: FactsViewController!
    
    override func awakeFromNib() {
        let configurator = FavouriteConfigurator()
        configurator.configureModuleForViewInput(viewInput: favouriteViewController)
    }
}
