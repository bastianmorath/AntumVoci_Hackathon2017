//
//  Globals.swift
//  AntumVocilist
//
//  Created by Bastian on 16.09.17.
//  Copyright © 2017 Bastian. All rights reserved.
//

import UIKit

class Globals: NSObject {
    @objc enum LanguageFormat:Int32 {
        case DE_EN = 0, DE_FR, EN_FR
    }
    @objc enum VocicardCellStatus:Int32 {
        case correct = 0, wrong, def
    }
    
    
    static var redColor: UIColor =  {
        return UIColor(red:1.0, green:54.0/255.0, blue:70.0/255.0, alpha:1.0)
    }()
    static var greyColor: UIColor =  {
        return UIColor(red:90/255.0, green:90/255.0, blue:90/255.0, alpha:1.0)
    }()
    static var darkGreyColor: UIColor =  {
        return UIColor(red:50/255.0, green:50/255.0, blue:50/255.0, alpha:1.0)
    }()
    static var lightGreyColor: UIColor =  {
        return UIColor(red:120/255.0, green:120/255.0, blue:120/255.0, alpha:1.0)
    }()
    static var greenColor: UIColor =  {
        return UIColor(red:51/255.0, green:217/255.0, blue:195/255.0, alpha:1.0)
    }()
}
