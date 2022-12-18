//
//  MeteoTableViewCell.swift
//  Meteo
//
//  Created by HONORE Adeline on 18/12/2022.
//

import UIKit

class MeteoTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    // MARK: - Properties
    
    static let identifier: String = "meteoTableViewCell"
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(infoMeteo: InfoMeteo) {
        cityNameLabel.text = infoMeteo.cityName
        temperatureLabel.text =  infoMeteo.temp
        descriptionLabel.text = infoMeteo.description
        iconImageView.image = infoMeteo.icon
    }
    
}
