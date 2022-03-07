//
//  SelectedSeatCell.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 20.02.2022.
//

import UIKit

class SelectedSeatCell: UICollectionViewCell {
    @IBOutlet weak var selectedSeatImg: UIImageView!
    @IBOutlet weak var selectedSeatNum: UILabel!
    func configure(model: SeatModel?){
        guard let input = model?.image else {return}
        self.selectedSeatNum.text = model?.text
        self.selectedSeatImg.image = model?.image ?? input
    }
    func selectImage(model: SeatModel) -> String {
        if model.isSelected {
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
