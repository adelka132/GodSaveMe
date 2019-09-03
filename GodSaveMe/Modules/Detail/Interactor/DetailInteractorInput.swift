//
//  DetailInteractorInput.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 17/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

protocol DetailInteractorInput {
    
    func getImageURL()
    func saveOrRemoveFact(with fact: Fact)
}
