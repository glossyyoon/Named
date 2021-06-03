//
//  MainViewController.swift
//  GiveMeAName
//
//  Created by 박지윤 on 2021/05/27.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore
import MaterialComponents


class MainViewController: UITableViewController{

    //MARK: - Navigation Bar
    @IBAction func categoryButtonPressed(_ sender: UIBarButtonItem) {
    }
    @IBAction func alertButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func mypageButtonPressed(_ sender: UIBarButtonItem) {
    }
    //MARK: - Table View Controller
    
    let db = Firestore.firestore()
    public var items: [Item] = []
    
    private var listener : ListenerRegistration!
    var rowSelected : Int?
    let subview = UIView()
    let cells = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFloatingButton()
        self.tableView.allowsSelection = true
        self.tableView.register(UINib(nibName: N.reusableCell, bundle: nil), forCellReuseIdentifier: N.nibName)
        self.tableView.rowHeight = 80
        loadItems()
        

    }
    func loadItems(){
            items = []
            db.collection("items")
                .order(by: "time", descending: true)
                .addSnapshotListener { (querySnapshot, error) in
                if let e = error{
                    print("Error in loadItems \(e)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents{
                        for doc in snapshotDocuments{
                            let data = doc.data()
                            if let titleSender = data["title"] as? String, let explanationSender = data["explanation"] as? String,
                               let isItNamedSender = data["isItNamed"] as? Bool, let userEmailSender = data["userEmail"] as? String{
                                let newItem = Item(title: titleSender, explanation: explanationSender, isItNamed: isItNamedSender, userEmail: userEmailSender)
                                self.items.append(newItem)
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    let indexPath = IndexPath(row: self.items.count-1, section: 0)
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                }
                            }
                        }
                    }
                }
            }
    }

    //MARK: - Floating Button For Write
    
    func setFloatingButton(){
        let screen = UIScreen.main.bounds
        let fbn = MDCFloatingButton(shape: .default)
        fbn.setBackgroundColor(UIColor(named: N.BrandColors.blue))
        fbn.setImageTintColor(UIColor(named: N.BrandColors.white), for: .normal)
        fbn.setImage(UIImage(systemName: "plus"), for: .normal)
        fbn.sizeToFit()
        cells.bringSubviewToFront(fbn)
        fbn.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
        if screen.height > 800{
            fbn.frame = CGRect(x: screen.width - 100, y: screen.height - 200, width: 72, height: 72)
        } else {
            fbn.frame = CGRect(x: screen.width - 100, y: screen.height - 170, width: 70, height: 70)
        }

        
    }
    @objc func tap(_ sender: Any) {
        performSegue(withIdentifier: N.writeSegue, sender: self)
    }
    
    //MARK: - Tablve View Cell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: N.nibName, for: indexPath) as? ProductCell
        
        cell?.titleLabel.text = item.title
        cell?.contentLable.text = item.explanation
        cell?.commentLabel.text = "댓글수: \(1)"
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        rowSelected = indexPath.row
        self.performSegue(withIdentifier: N.detailSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = items[rowSelected!]
        if segue.identifier == N.detailSegue{
            if let vc = segue.destination as? ReadViewController{
                vc.titleValue = item.title
                vc.contentValue = item.explanation
                
            }
        }
    }

    
}

