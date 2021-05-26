//
//  ImageCellTableViewCell.swift
//  GiveMeAName
//
//  Created by 박지윤 on 2021/05/25.
//

import UIKit

class ImageCellTableViewCell: UITableViewCell {
    @IBOutlet weak var ItemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
