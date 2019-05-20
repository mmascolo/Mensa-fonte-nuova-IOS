//
//  saldo_cell.swift
//  Menu
//
//  Created by Michele Mascolo on 10/05/2019.
//  Copyright © 2019 Michele Mascolo. All rights reserved.
//

import UIKit

class saldo_cell: UITableViewCell {
    @IBOutlet weak var bambinosaldo: UILabel!
    
    @IBOutlet weak var soldi: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
