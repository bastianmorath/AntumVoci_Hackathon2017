//
//  DataStore.swift
//  AntumVocilist
//
//  Created by Bastian on 17.09.17.
//  Copyright © 2017 Bastian. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataStore {
    static let sharedInstance = DataStore()
    var context:NSManagedObjectContext {
        get {
            return persistentContainer.viewContext
        }
    }
    
    private init() {
        
    }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK - SETTERS
    
    func createVocilist(name: String, languageFormat: Globals.LanguageFormat, cards:[Vocicard]) -> Vocilist{
        let list = Vocilist(context:context)
        list.name = name
        list.languageFormat = languageFormat.rawValue
        list.cards = Set(cards) as NSSet
        saveContext()
        return list
    }
    
    func deleteVocilistWithID(id: NSManagedObjectID) {
        
        let request = NSFetchRequest<Vocilist>(entityName: "Vocilist")
        do {
            let searchResults = try context.fetch(request)
            for vocilist in searchResults {
                if vocilist == context.object(with: id) {
                    // delete vocilist
                    context.delete(vocilist)
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
        saveContext()
    }
    
    func createVocicard(word: String, translation: String, status: Globals.VocicardCellStatus) -> Vocicard {
        let card = Vocicard(context:context)
        card.word = word
        card.translation = translation
        card.status = status.rawValue
        saveContext()
        return card
    }
    
    func deleteVocicardWithID(id: NSManagedObjectID) {
        
        let request = NSFetchRequest<Vocilist>(entityName: "Vocicard")
        do {
            let searchResults = try context.fetch(request)
            for vocicard in searchResults {
                if vocicard == context.object(with: id) {
                    // delete vocilist
                    context.delete(vocicard)
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
        saveContext()
    }
    
 
    

    
    // MARK - GETTERS
    func getVocilists() -> [Vocilist]? {
        do {
            return try context.fetch(Vocilist.fetchRequest())
        }catch {
            print("Error fetching data from CoreData")
            return nil
        }
    }
    
    func createMockData() {
        let vocilist1 = createVocilist(name: "Vocilist 1", languageFormat: .DE_EN, cards: [])
            
        for i in 1...50 {
            let vocicard = createVocicard(word: "Card"+String(i), translation: "Translation"+String(i), status: .def)
            vocilist1.addCardToList(card: vocicard)
        }
        let vocilist2 = createVocilist(name: "Vocilist 2", languageFormat: .EN_FR, cards: [])
        
        for i in 1...7 {
            let vocicard = createVocicard(word: "Card"+String(i), translation: "Translation"+String(i), status: .def)
            vocilist2.addCardToList(card: vocicard)
        }
        let vocilist3 = createVocilist(name: "Vocilist 3", languageFormat: .DE_FR, cards: [])
        
        for i in 1...3 {
            let vocicard = createVocicard(word: "Card"+String(i), translation: "Translation"+String(i), status: .def)
            vocilist3.addCardToList(card: vocicard)
        }
    }
}
