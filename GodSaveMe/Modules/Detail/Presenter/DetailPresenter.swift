//
//  DetailPresenter.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 18/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import Foundation

private let deleteFromFavourite = "Удалить из избранных"
private let addToFavourite = "Добавить в избранное"

final class DetailPresenter: DetailViewOutput, DetailModuleInput {

    //MARK: - Properties
    
    private var fact: Fact?
    
    weak var view: DetailViewInput!
    var interactor: DetailInteractor!
    
    //MARK: - DetailViewOutput
    
    func viewIsReady() {
        interactor.getImageURL()
        guard let fact = fact else { return }
        view.setText(fact.text)
        setButtonTitle()
    }
    
    func viewWillAppear() {
        setButtonTitle()
    }
    
    func favouriteButtonTap() {
        guard let fact = fact else { return }
        interactor.saveOrRemoveFact(with: fact)
    }
    
    //MARK: - DetailModuleInput
    
    func setFact(_ fact: Fact) {
        self.fact = fact
    }
    
    //MARK: - Support methods
    
    private func setButtonTitle() {
        guard let fact = fact else { return }
        let buttonTitle = interactor.objectExist(id: fact.id) ? deleteFromFavourite : addToFavourite
        view.setButtonTitle(buttonTitle)
    }
}

//MARK: - DetailInteractorOutput

extension DetailPresenter: DetailInteractorOutput {
   
    func successFetch(image url: URL) {
        view.set(image: url)
    }
    
    func successRemoveFact() {
        view.setButtonTitle(addToFavourite)
    }
    
    func successAddFact() {
        view.setButtonTitle(deleteFromFavourite)
    }
}
