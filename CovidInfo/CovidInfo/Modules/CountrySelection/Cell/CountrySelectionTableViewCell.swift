//
//  CountrySelectionTableViewCell.swift
//  CovidInfo
//
//  Created by Fulden Onan on 9.12.2022.
//

import UIKit

class CountrySelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var recoveredCountLabel: UILabel!
    @IBOutlet weak var deathCountLabel: UILabel!
    @IBOutlet weak var confirmedCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
