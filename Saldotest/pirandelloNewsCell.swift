//
//  pirandelloNewsCell.swift
//  Menu
//
//  Created by Michele Mascolo on 10/05/2019.
//  Copyright © 2019 Michele Mascolo. All rights reserved.
//import UIKit



class pirandelloNewsCell: UITableViewCell {
    @IBOutlet weak var titleLabel:UILabel!
    
    @IBOutlet weak var bambinosaldo: UILabel!
    @IBOutlet weak var descriptionLabel:UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 4
        }
    }
    
    @IBOutlet weak var dateLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

