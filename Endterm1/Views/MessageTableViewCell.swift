//
//  MessageTableViewCell.swift
//  Endterm1
//
//  Created by Dias Karimov on 14.05.2022.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
