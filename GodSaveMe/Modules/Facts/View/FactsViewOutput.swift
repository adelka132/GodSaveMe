//
//  FactsViewOutput.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 14/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

protocol FactsViewOutput {
    
    func viewIsReady()
    func viewWillAppear()
    func dataCount() -> Int
    func getFact(for row: Int) -> Fact
    func selectedCell(for row: Int)
    func getSelectedFact() -> Fact?
}
