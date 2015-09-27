//
//  BusinessCell.swift
//  Yelp
//
//  Created by Mo, Kevin on 9/26/15.

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var costLabel: UILabel!
    //@IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    @IBOutlet weak var categoriesLabel: UILabel!
    
    
    // observers for the businesses.
    var business : Business! {
        didSet {
            nameLabel.text = business.name
            thumbImageView.setImageWithURL(business.imageURL)
            categoriesLabel.text = business.categories
            //addressLabel.text = business.address
            reviewCountLabel.text = "\(business.reviewCount!) Reviews"
            ratingImageView.setImageWithURL(business.ratingImageURL)
            distanceLabel.text = business.distance
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbImageView.layer.cornerRadius = 3
        thumbImageView.clipsToBounds = true
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
