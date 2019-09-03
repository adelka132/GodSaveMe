//
//  FactsInteractor.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 15/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import Alamofire
import RealmSwift

final class FactsInteractor: FactsInteractorInput {
    
    //MARK: - Properties
    
    private var realm: Realm {
        return try! Realm()
    }
    
    weak var output: FactsInteractorOutput!
    
    //MARK: - FactsInteractorInput
    
    func getDataFromWeb() {
        
        request("https://cat-fact.herokuapp.com/facts").responseJSON { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let value):
                guard let jsonDictionary = value as? Dictionary<String, Any>,
                    let jsonArray = jsonDictionary["all"] as? Array<[String: Any]> else {
                        return
                }
                
                let facts = jsonArray.compactMap {
                    Fact(JSON: $0)
                }
                
                self.output.successFetch(facts: facts)
                
            default: break
            }
        }
    }
    
    func getDataFromDB() {
        let objects = realm.objects(FactObject.self).map {
            Fact(managedObject: $0)
        }
        
        output.successFetch(facts: Array(objects))
    }
}
