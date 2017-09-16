//
//  VocicardViewController.swift
//  AntumVocilist
//
//  Created by Bastian on 16.09.17.
//  Copyright © 2017 Bastian. All rights reserved.
//

import UIKit

class VocicardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var vocilist: Vocilist!
    var currentActiveIndex:IndexPath = IndexPath(row: 0, section: 0)
    
    var activeCell:VocicardTableViewCell {
        get {
            return self.tableView.cellForRow(at: currentActiveIndex) as! VocicardTableViewCell
        }
    }
 
    @IBAction func wrongButton(_ sender: Any) {
        vocilist.cards[currentActiveIndex.row].status = Globals.vocicardCellStatus.wrong
        _updateTableView()
        
    }
    @IBAction func correctButton(_ sender: Any) {
        vocilist.cards[currentActiveIndex.row].status = Globals.vocicardCellStatus.correct
        _updateTableView()
    }
    
    @IBAction func viewPressedDown(_ sender: Any) {
        activeCell.coverView.isHidden = true
    }
    
    @IBAction func viewReleased(_ sender: Any) {
        activeCell.coverView.isHidden = false
    }
    
    
    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var wrongButton: UIButton!
    @IBOutlet weak var correctButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate=self
        self.tableView.dataSource=self

        self.navigationItem.title = vocilist.name
        self.viewButton.setImage(UIImage(named: "eye"), for: .normal)
        self.wrongButton.setImage(UIImage(named: "delete"), for: .normal)
        self.correctButton.setImage(UIImage(named: "checkmark"), for: .normal)
        self.correctButton.imageEdgeInsets = UIEdgeInsetsMake(42,42,42,42)
        self.wrongButton.imageEdgeInsets = UIEdgeInsetsMake(50,50,50,50)
        self.viewButton.imageEdgeInsets = UIEdgeInsetsMake(42,42,42,42)
        self.wrongButton.imageView?.contentMode = .scaleAspectFit
        self.viewButton.imageView?.contentMode = .scaleAspectFit
        self.correctButton.imageView?.contentMode = .scaleAspectFit

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.viewButton.addGestureRecognizer(gestureRecognizer)
    }
    
    func handlePan() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func _updateTableView() {
        let newIndexPath = IndexPath(row: currentActiveIndex.row+1, section: currentActiveIndex.section)
        if newIndexPath.row < vocilist.cards.count {
            currentActiveIndex = newIndexPath
        }
        self.tableView.scrollToRow(at: currentActiveIndex, at: .middle, animated: true)
        self.tableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocilist.cards.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vocicard = vocilist.cards[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "vocicardCell", for: indexPath) as? VocicardTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        cell.leftLabel.text = vocicard.word
        cell.rightLabel.text = vocicard.translation
        cell.coverView.isHidden=false
        
        // OUT OF RANGE ERROR
        if indexPath == currentActiveIndex {
            cell.backgroundColor = Globals.lightGreyColor
        } else {
            cell.backgroundColor = Globals.greyColor

        }
        if vocicard.status==Globals.vocicardCellStatus.def {
            cell.coverView.isHidden=false
            cell.resultBar.backgroundColor=Globals.darkGreyColor
        } else if vocicard.status == Globals.vocicardCellStatus.correct {
            cell.coverView.isHidden = true
            cell.resultBar.backgroundColor=Globals.greenColor
        } else {
            cell.coverView.isHidden = true
            cell.resultBar.backgroundColor=Globals.redColor
        }
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentActiveIndex=indexPath
        tableView.reloadData()
    }

    

}
