//
//  ReadViewController.swift
//  GiveMeAName
//
//  Created by 박지윤 on 2021/05/28.
//

import Foundation
import UIKit
import Firebase

class ReadViewController: UIViewController{
    
    var comments: [Comment] = []
    
    var titleValue: String = ""
    var contentValue: String = ""
    @IBOutlet var detailTitle: UILabel!
    @IBOutlet var detailCategory: UILabel!
    @IBOutlet var detailUser: UILabel!
    @IBOutlet var detailDate: UIView!
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var detailContents: UITextView!
    
    @IBOutlet var comment: CommentContainerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTitle.text = titleValue
        detailContents.text = contentValue
    }
}
