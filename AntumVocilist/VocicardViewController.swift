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
    
    @IBAction func wrongButton(_ sender: Any) {
    }
    @IBAction func correctButton(_ sender: Any) {
    }
    @IBAction func viewPressedDown(_ sender: Any) {
    }
    @IBAction func viewReleased(_ sender: Any) {
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate=self
        self.tableView.dataSource=self

        self.navigationItem.title = vocilist.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        cell.coverView.isHidden = true
        return cell

    }

    

}
