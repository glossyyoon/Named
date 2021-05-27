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
import MaterialComponents.MaterialButtons

class MainViewController: UIViewController{
    @IBAction func categoryButtonPressed(_ sender: UIBarButtonItem) {
    }
    @IBAction func alertButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func mypageButtonPressed(_ sender: UIBarButtonItem) {
    }
    let db = Firestore.firestore()
    var items : [Item] = []
    private var listener : ListenerRegistration!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var writeButton: UIButton!
    let subview = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UINib(nibName: N.reusableCell, bundle: nil), forCellReuseIdentifier: N.nibName)
        tableView.rowHeight = 80

        setFloatingButton()
        loadItems()

    }
    func loadItems(){
        db.collection("pet").addSnapshotListener { (querySnapshot, error) in
            self.items = []
            if let e = error{
                print("Error in loadItems \(e)")
            }else{
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
    func setFloatingButton(){
        var constraintX: NSLayoutConstraint
        var constraintY: NSLayoutConstraint
        let fbn = MDCFloatingButton(shape: .default)
        fbn.minimumSize = CGSize(width: 64, height: 48)
        fbn.setBackgroundColor(UIColor(named: N.BrandColors.blue))
        fbn.setImageTintColor(UIColor(named: N.BrandColors.pink), for: .normal)
        fbn.sizeToFit()
        fbn.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(fbn)
        fbn.frame = CGRect(x: 200, y: 300, width: 64, height: 48)
        
    }
    @objc func tap(_ sender: Any) {
        print("Hello World")
    }
    
}
extension MainViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt  indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: N.nibName, for: indexPath) as? ProductCell
        cell?.titleLabel.text = item.title
        cell?.contentLable.text = item.explanation
        cell?.commentLabel.text = "댓글수: \(1)"
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        

    }
}
