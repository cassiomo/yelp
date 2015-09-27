//
//  FilterSwitchTableViewCell.swift
//  Yelp
//
//  Created by Mo, Kevin on 9/27/15.
//  Copyright © 2015 Kevin Mo. All rights reserved.
//

import UIKit

class FilterSwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var categoriesFilterLabel: UILabel!
    
    @IBOutlet weak var categoriesOnSwitch: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
