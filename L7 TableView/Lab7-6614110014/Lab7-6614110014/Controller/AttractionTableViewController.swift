//
//  AttractionTableViewController.swift
//  Lab7-6614110014
//
//  Created by MII-MAC-21 on 2/1/2568 BE.
//

import UIKit
import Firebase

class AttractionTableViewController: UITableViewController {
    
    var attractionNames = [String]()
    var attractionImages = [String]()
    var webAddresses = [String]()
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference(withPath: "users")
        self.ref.child("user_id").setValue(6614110014)
        self.ref.child("name").setValue("Thewa")
        self.ref.child("user").setValue("thewa")
        self.ref.child("pass").setValue("qwerty")
        
        ref.observe(.value, with: { snapshot in
            print("snapshot")
            print((snapshot.value! as Any))
        })
        
        self.ref.child("user_id").observeSingleEvent(of: .value, with: {
            (snapshot) in
            if let id = snapshot.value as? Int {
                print("The value from datatbase: \(id)")
            }
        })
        
        initialize()
    }
    
    func initialize() {
        attractionNames = ["Buckingham Palace",
                           "The Eiffel Tower","The Grand Canyon", "Windsor Castle",
                           "Empire State Building", "Bangkok", "Nakhon Sawan"]
        webAddresses = ["https://en.wikipedia.org/wiki/Buckingham_Palace",
                        "https://en.wikipedia.org/wiki/Eiffel_Tower",
                        "https://en.wikipedia.org/wiki/Grand_Canyon",
                        "https://en.wikipedia.org/wiki/Windsor_Castle",
                        "https://en.wikipedia.org/wiki/Empire_State_Building",
                        "https://en.wikipedia.org/wiki/Bangkok",
                        "https://en.wikipedia.org/wiki/Nakhon_Sawan"]
        attractionImages = ["buckingham_palace.jpg",
                            "eiffel_tower.jpg","grand_canyon.jpg", "windsor_castle.jpg",
                            "empire_state_building.jpg", "bangkok.jpg", "nakhonsawan.jpg"]
        
//        tableView.estimatedRowHeight = 50
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAttractionDetail" {
            let detailViewController = segue.destination as!
            AttractionDetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailViewController.webSite = webAddresses[row]
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return attractionNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"AttractionTableCell", for: indexPath) as! AttractionTableViewCell
        let row = indexPath.row
        cell.attractionLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        cell.attractionLabel.text = attractionNames[row]
        cell.attractionImage.image = UIImage(named: attractionImages[row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, completionHandler) in
            let row = indexPath.row
            self.attractionNames.remove(at: row)
            self.attractionImages.remove(at: row)
            self.webAddresses.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
        })])
        return configuration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let shareAction = UIContextualAction(style: .normal, title: "Share") { [weak self] (action, view, completionHandler) in
            guard let self = self else {
                completionHandler(false)
                return
            }
            
            let row = indexPath.row
            let itemToShare = self.webAddresses[row]
            
            self.shareItem(from: self, item: itemToShare)
            completionHandler(true)
        }
        
        shareAction.backgroundColor = .systemBlue
        
        let swipeActions = UISwipeActionsConfiguration(actions: [shareAction])
        return swipeActions
    }
    
    func shareItem(from viewController: UIViewController, item: Any) {
        let activityViewController = UIActivityViewController(activityItems: [item], applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = [.addToReadingList, .assignToContact]
        
        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = viewController.view
            popoverController.sourceRect = viewController.view.bounds
            popoverController.permittedArrowDirections = .any
        }
        
        viewController.present(activityViewController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Thewa Laokasikan ID:6614110014"
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
