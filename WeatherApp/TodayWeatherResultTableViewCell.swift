//
//  TodayWeatherResultTableViewCell.swift
//  WeatherApp
//
//  Created by Gizem Genc on 11.09.2019.
//

import UIKit

class TodayWeatherResultTableViewCell: UITableViewCell {

    
    @IBOutlet weak var resultText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
