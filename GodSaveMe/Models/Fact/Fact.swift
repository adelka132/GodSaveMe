//
//  Fact.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 17/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import RealmSwift
import ObjectMapper

final class FactObject: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var text: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

final class Fact: Mappable {
    
    var id: String = ""
    var text: String = ""
    
    convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id   <- map["_id"]
        text <- map["text"]
    }
}

extension Fact {
    
    convenience init(managedObject: FactObject) {
        self.init()
        id = managedObject.id
        text = managedObject.text
    }
    
    func managedObject() -> FactObject {
        let managedObject = FactObject()
        managedObject.id = id
        managedObject.text = text
        
        return managedObject
    }
}
