//
//  Vocilist+CoreDataProperties.swift
//  AntumVocilist
//
//  Created by Bastian on 17.09.17.
//  Copyright © 2017 Bastian. All rights reserved.
//

import Foundation
import CoreData


extension Vocilist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vocilist> {
        return NSFetchRequest<Vocilist>(entityName: "Vocilist")
    }

    @NSManaged public var name: String?
    @NSManaged public var languageFormat: Int32
    @NSManaged public var cards: NSSet

}

// MARK: Generated accessors for cards
extension Vocilist {

    @objc(addCardsObject:)
    @NSManaged public func addToCards(_ value: Vocicard)

    @objc(removeCardsObject:)
    @NSManaged public func removeFromCards(_ value: Vocicard)

    @objc(addCards:)
    @NSManaged public func addToCards(_ values: NSSet)

    @objc(removeCards:)
    @NSManaged public func removeFromCards(_ values: NSSet)
    
    func addCardToList(card:Vocicard) {
        let list = self.mutableSetValue(forKey: "cards")
        list.add(card)
    }

    func getCards() -> [Vocicard] {
        var tmpsak: [Vocicard]
        tmpsak = self.cards.allObjects as! [Vocicard]
        
        return tmpsak
    }
    
    var languageDescription : String {
        get {
            switch(languageFormat) {
            case Globals.LanguageFormat.DE_EN.rawValue:
                return "DE-EN"
            case Globals.LanguageFormat.DE_FR.rawValue:
                return "DE-FR"
            case Globals.LanguageFormat.EN_FR.rawValue:
                return "EN-FR"
            default: return "DE-EN"
            }
        }
    }

}
