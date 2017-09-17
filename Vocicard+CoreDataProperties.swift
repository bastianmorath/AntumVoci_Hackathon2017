//
//  Vocicard+CoreDataProperties.swift
//  AntumVocilist
//
//  Created by Bastian on 17.09.17.
//  Copyright © 2017 Bastian. All rights reserved.
//

import Foundation
import CoreData


extension Vocicard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vocicard> {
        return NSFetchRequest<Vocicard>(entityName: "Vocicard")
    }

    @NSManaged public var word: String?
    @NSManaged public var translation: String?
    @NSManaged public var status: Int32

}
