//
//  Vocicard.swift
//  AntumVocilist
//
//  Created by Bastian on 16.09.17.
//  Copyright © 2017 Bastian. All rights reserved.
//

import Foundation
import UIKit

class Vocicard {
    var word: String
    var translation: String
    var status: Globals.vocicardCellStatus
    
    init?(word: String, translation: String) {
        self.word = word
        self.translation = translation
        self.status = Globals.vocicardCellStatus.def
    }
}
