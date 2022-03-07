//
//  TicketModel.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 20.02.2022.
//

import Foundation

struct TicketModel{
    var passenger: Passenger?
    var numberOfSeats: Int?
    var seat: [SeatModel]?
    var bus: BusModel?
    var cost = 0
    
}
