//
//  MainViewController.swift
//  GiveMeAName
//
//  Created by 박지윤 on 2021/05/25.
//

import Foundation
import UIKit
import CoreData

class MainViewController: UIViewController{
    
//    var itemArray = [Item]()
    var items : [ItemWithImage] = [
        ItemWithImage(title: "강아지 이름 지어주세요", explanation: "우리 강아지 귀엽죠", isItemNamed: false),
        ItemWithImage(title: "고양이 이름 지어주세요", explanation: "우리집 고양이 츄르를 좋아해", isItemNamed: false),
        ItemWithImage(title: "저희 팀 이름을 지어주세요!", explanation: "공모전 1등할겁니다", isItemNamed: false),
        ItemWithImage(title: "새로운 브랜드 캐릭터 이름을 지어주세요", explanation: "Do we know why hidesBackButton does not only hide  Is this a feature or a bug? I need to hide depending on changing conditions in a hierarchy of view controllers where replacing the left bar button item like this apparently introduces more problems than it solves", isItemNamed: false)
    ]

    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.hidesBackButton = true
        tableView.dataSource = self
        tableView.register(UINib(nibName: N.reusableCell, bundle: nil), forCellReuseIdentifier: N.nibName)
        tableView.rowHeight = 80

    }
    func loadItems(){
        
    }
}
extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
