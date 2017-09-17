//
//  VocicardTableViewCell.swift
//  AntumVocilist
//
//  Created by Bastian on 16.09.17.
//  Copyright © 2017 Bastian. All rights reserved.
//

import UIKit

class VocicardTableViewCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var resultBar: UIView!
    var status: Globals.VocicardCellStatus = Globals.VocicardCellStatus.correct {
        didSet {
            switch status {
            case Globals.VocicardCellStatus.correct:
                print("Correct")
            case Globals.VocicardCellStatus.wrong:
                print("Wrong")
            default:
                print("default")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
