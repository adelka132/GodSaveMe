//
//  DetailViewInput.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 17/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import Foundation

protocol DetailViewInput: class {
    
    func set(image url: URL)
    func setText(_ text: String)
    func setButtonTitle(_ text: String)
}
