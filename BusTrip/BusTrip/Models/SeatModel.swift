//
//  SeatModel.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 20.02.2022.
//

import Foundation
import UIKit

class SeatModel {
    
    //var bus: BusModel
    var seatNumber: Int
    var image: UIImage
    var isBooked: Bool
    var text: String
    var gender: Int = 0 // 0 yok 1 kız 2 erkek
    var isSelected: Bool
    
    init( seatNumber: Int, image: UIImage, isBooked: Bool, text: String, gender: Int, isSelected: Bool) {
       // self.bus = bus
        self.seatNumber = seatNumber
        self.image = image
        self.isBooked = isBooked
        self.text = text
        self.gender = gender
        self.isSelected = isSelected
    }
    
}
