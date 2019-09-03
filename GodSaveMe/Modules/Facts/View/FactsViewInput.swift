//
//  FactsViewInput.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 14/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

protocol FactsViewInput: class {
    
    func reload()
    func startLoader()
    func stopLoader()
    func showDetail()
}
