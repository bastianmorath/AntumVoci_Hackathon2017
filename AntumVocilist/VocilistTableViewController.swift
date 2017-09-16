//
//  VocilistTableViewController.swift
//  AntumVocilist
//
//  Created by Bastian on 16.09.17.
//  Copyright © 2017 Bastian. All rights reserved.
//

import UIKit

class VocilistTableViewController: UITableViewController {

    var vocilists = [Vocilist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleVoiclists()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog(String(vocilists.count))
        return vocilists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "vocilistCellIdentifier", for: indexPath) as? VocilistTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }

        let vocilist = vocilists[indexPath.row]
        cell.nameLabel.text = vocilist.name
        cell.languageFormatLabel.text = String(describing: vocilist.languageFormat)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "detailViewSegue") {
            // pass data to next view
            let viewController:VocicardViewController = segue.destination as! VocicardViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            viewController.vocilist = vocilists[indexPath!.row]
        }
    }
 
    
    private func loadSampleVoiclists() {
        
        guard let vocicard1 = Vocicard(word: "Tisch", translation: "Table") else {
            fatalError("Unable to instantiate vocicard1")
        }
        guard let vocicard2 = Vocicard(word: "Stuhl", translation: "Chair") else {
            fatalError("Unable to instantiate vocicard2")
        }
        guard let vocicard3 = Vocicard(word: "Essen", translation: "Food") else {
            fatalError("Unable to instantiate vocicard3")
        }
        guard let vocicard4 = Vocicard(word: "Auto", translation: "Car") else {
            fatalError("Unable to instantiate vocicard4")
        }
        guard let vocicard5 = Vocicard(word: "Töff", translation: "Motorcycle") else {
            fatalError("Unable to instantiate vocicard5")
        }
        
        guard let vocilist1 = Vocilist(name: "Vocilist 1", languageFormat: Globals.LanguageFormat.DE_EN, cards: [vocicard1, vocicard3]) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let vocilist2 = Vocilist(name: "Vocilist 2", languageFormat: Globals.LanguageFormat.DE_EN, cards: [vocicard1, vocicard2, vocicard3, vocicard4, vocicard5]) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let vocilist3 = Vocilist(name: "Vocilist 3", languageFormat: Globals.LanguageFormat.DE_EN, cards: [vocicard3, vocicard4, vocicard5]) else {
            fatalError("Unable to instantiate meal1")
        }
        
        vocilists += [vocilist1, vocilist2, vocilist3]
    }

}
