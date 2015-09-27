//
//  FilterSwitchTableViewCell.swift
//  Yelp
//
//  Created by Mo, Kevin on 9/27/15.
//  Copyright © 2015 Kevin Mo. All rights reserved.
//

import UIKit

@objc protocol FilterSwitchTableViewCellDelegate {
    optional func switchCell(filterSwitchTableViewCell: FilterSwitchTableViewCell, didChangeValue value: Bool)
}

class FilterSwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var categoriesFilterLabel: UILabel!
    
    @IBOutlet weak var categoriesOnSwitch: UISwitch!

    weak var delegate: FilterSwitchTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoriesOnSwitch.addTarget(self, action: "categoriesSwitchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func categoriesSwitchValueChanged() {
        print("switch value change")
        if delegate != nil {
            delegate?.switchCell?(self, didChangeValue: categoriesOnSwitch.on)
        }
    }

}
