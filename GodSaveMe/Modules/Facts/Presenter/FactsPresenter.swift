//
//  FactsPresenter.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 14/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import Foundation

enum FactsScreenType {
    case factsList
    case favouriteFacts
}

final class FactsPresenter: FactsViewOutput, FactsInteractorOutput {
    
    //MARK: - Properties
    
    private let screenType: FactsScreenType
    private var facts: [Fact] = []
    private var selectedFact: Fact?
    
    weak var view: FactsViewInput!
    var interactor: FactsInteractor!
    
    init(with type: FactsScreenType) {
        screenType = type
    }
    
    //MARK: - FactsViewOutput
    
    func viewIsReady() {
        
        switch screenType {
        case .factsList:
            view.startLoader()
            interactor.getDataFromWeb()
            
        case .favouriteFacts:
            interactor.getDataFromDB()
        }
    }
    
    func viewWillAppear() {
        
        if screenType == .favouriteFacts {
            interactor.getDataFromDB()
        }
    }
    
    func dataCount() -> Int {
        return facts.count
    }
    
    func getFact(for row: Int) -> Fact {
        return facts[row]
    }
    
    func selectedCell(for row: Int) {
        selectedFact = facts[row]
        view.showDetail()
    }
    
    func getSelectedFact() -> Fact? {
        return selectedFact
    }
    
    //MARK: - FactsInteractorOutput
    
    func successFetch(facts: [Fact]) {
        self.facts = facts
        view.stopLoader()
        view.reload()
    }
}
