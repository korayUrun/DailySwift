//
//  FeedCell.swift
//  FotografPaylasmaApp
//
//  Created by Koray Urun on 17.07.2025.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet var emailText: UITextField!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var yorumText: UITextField!
      
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
