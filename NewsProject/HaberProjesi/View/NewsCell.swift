//
//  NewsCell.swift
//  HaberProjesi
//
//  Created by Koray Urun on 18.07.2025.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var storyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
