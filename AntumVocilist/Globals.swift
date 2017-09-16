//
//  Globals.swift
//  AntumVocilist
//
//  Created by Bastian on 16.09.17.
//  Copyright © 2017 Bastian. All rights reserved.
//

import UIKit

class Globals: NSObject {
    enum LanguageFormat {
        case DE_EN, DE_FR, EN_FR
    }
    enum vocicardCellStatus {
        case correct, wrong, def
    }
    static var redColor: UIColor =  {
        return UIColor(red:1.0, green:54.0/255.0, blue:70.0/255.0, alpha:1.0)
    }()
    static var greyColor: UIColor =  {
        return UIColor(red:120/255.0, green:120/255.0, blue:120/255.0, alpha:1.0)
    }()
    static var darkGreyColor: UIColor =  {
        return UIColor(red:60/255.0, green:60/255.0, blue:60/255.0, alpha:1.0)
    }()
    static var lightGreyColor: UIColor =  {
        return UIColor(red:180/255.0, green:180/255.0, blue:180/255.0, alpha:1.0)
    }()
    static var greenColor: UIColor =  {
        return UIColor(red:51/255.0, green:217/255.0, blue:195/255.0, alpha:1.0)
    }()
}
