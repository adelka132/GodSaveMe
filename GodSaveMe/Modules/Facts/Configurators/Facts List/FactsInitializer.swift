//
//  FactsInitializer.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 14/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import UIKit

final class FactsInitializer: NSObject {

    @IBOutlet private weak var factsViewController: FactsViewController!
    
    override func awakeFromNib() {
        let configurator = FactsConfigurator()
        configurator.configureModuleForViewInput(viewInput: factsViewController)
    }
}
