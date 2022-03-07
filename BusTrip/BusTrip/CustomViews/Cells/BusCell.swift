//
//  BusCell.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 20.02.2022.
//

import UIKit

class BusCell: UICollectionViewCell {
    @IBOutlet weak var busImage: UIImageView!
    @IBOutlet weak var busTime: UILabel!
    @IBOutlet weak var busPrice: UILabel!
    
    func configure (model: BusModel) {
        self.busTime.text = model.time
        self.busPrice.text = "\(String(model.price)).00 TL"
        self.busImage.image = model.companyImg
    }
}
