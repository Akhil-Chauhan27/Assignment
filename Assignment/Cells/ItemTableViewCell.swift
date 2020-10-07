//
//  ItemTableViewCell.swift
//  Assignment
//
//  Created by Akhil Chauhan on 07/10/20.
//  Copyright © 2020 Akhil Chauhan. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_description: UILabel!
    @IBOutlet weak var img_item: UIImageView!
    @IBOutlet weak var background_view: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
