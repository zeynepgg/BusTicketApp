//
//  SharedTickets.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 22.02.2022.
//
 //MARK: Singleton Class

import Foundation

class SharedTickets {
    static let sharedIntance = SharedTickets()
    static var bookedTickets = [TicketModel]()
}
