//
//  BusModel.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 19.02.2022.
//

import Foundation
import UIKit
struct BusModel {
    var cityFrom: String
    var cityTo: String
    var date: String
    var time: String
    var price: Int
    var soldSeats: [String : Int]
    let id: Int
    let companyName: String
    let companyImg: UIImage
}
