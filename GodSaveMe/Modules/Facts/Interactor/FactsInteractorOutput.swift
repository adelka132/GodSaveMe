//
//  FactsInteractorOutput.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 15/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

protocol FactsInteractorOutput: class {
    
    func successFetch(facts: [Fact])
}
