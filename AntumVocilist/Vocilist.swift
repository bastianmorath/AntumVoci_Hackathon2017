//
//  Vocilist.swift
//  AntumVocilist
//
//  Created by Bastian on 16.09.17.
//  Copyright © 2017 Bastian. All rights reserved.
//

import Foundation
import UIKit

class Vocilist {
    var name: String
    var cards: [Vocicard]
    var languageFormat: Globals.LanguageFormat
    
    init?(name: String, languageFormat: Globals.LanguageFormat, cards: [Vocicard]) {
        guard !cards.isEmpty else {
            return nil
        }
        self.name = name
        self.cards = cards
        self.languageFormat = languageFormat
    }
}
