//
//  DetailIteractor.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 17/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import Alamofire
import RealmSwift

final class DetailInteractor: DetailInteractorInput {
    
    //MARK: - Properties
    
    weak var output: DetailInteractorOutput!
    private var realm: Realm { return try! Realm() }
    
    //MARK: - DetailInteractorInput
    
    func getImageURL() {
        
        request("https://aws.random.cat/meow").responseJSON { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let value):
                guard let jsonDictionary = value as? Dictionary<String, Any>,
                    let imageURL = jsonDictionary["file"] as? String,
                    let url = URL(string: imageURL) else { return }
                
                self.output.successFetch(image: url)
                
            default: break
            }
        }
    }
    
    func saveOrRemoveFact(with fact: Fact) {
        
        if objectExist(id: fact.id) {
            try? realm.write {
                guard let obj = realm.object(ofType: FactObject.self, forPrimaryKey: fact.id) else { return }
                realm.delete(obj)
                self.output.successRemoveFact()
            }
            
        } else {
            try? realm.write {
                realm.add(fact.managedObject(), update: true)
                self.output.successAddFact()
            }
        }
    }
    
    func objectExist(id: String) -> Bool {
        return realm.object(ofType: FactObject.self, forPrimaryKey: id) != nil
    }
}
