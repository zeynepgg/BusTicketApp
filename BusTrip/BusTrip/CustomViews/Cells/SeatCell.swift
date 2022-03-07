//
//  SeatCell.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 20.02.2022.
//

import UIKit

class SeatCell: UICollectionViewCell {
    
    @IBOutlet weak var seatNumberLabel: UILabel!
    @IBOutlet weak var seatImage: UIImageView!
    
    
    func configure(model: SeatModel) {
        self.seatNumberLabel.text = model.text
        self.seatImage.image = UIImage(named: selectImage(model: model))
    }
    
    func selectImage(model: SeatModel) -> String {
        if model.isBooked {
            if model.gender == 1 {
                return "pembeKoltuk"
            }else if model.gender == 2 {
                return "maviKoltuk"
            }else {
                return "griKoltuk"
            }
        } else {
            return "griKoltuk"
        }
    }
}
