//
//  WeatherDetailsCell.swift
//  WeatherApp
//
//  Created by Harish Gangula on 19/01/18.
//  Copyright © 2018 Anuja Deshmukh. All rights reserved.
//

import UIKit

class WeatherDetailsCell: UITableViewCell {

    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblNameCity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
