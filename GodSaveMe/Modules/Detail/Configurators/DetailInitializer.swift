//
//  DetailInitializer.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 18/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import UIKit

final class DetailInitializer: NSObject {

    @IBOutlet private weak var detailViewController: DetailViewController!
    
    override func awakeFromNib() {
        let configurator = DetailConfigurator()
        configurator.configureModuleForViewInput(viewInput: detailViewController)
    }
}
