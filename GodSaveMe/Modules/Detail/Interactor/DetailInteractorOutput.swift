//
//  DetailInteractorOutput.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 17/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import Foundation

protocol DetailInteractorOutput: class {
    
    func successFetch(image url: URL)
    
    func successRemoveFact()
    func successAddFact()
}
