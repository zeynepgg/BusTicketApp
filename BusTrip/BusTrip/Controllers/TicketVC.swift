//
//  TicketVC.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 22.02.2022.
//

import UIKit

class TicketVC: UIViewController {

    let ticketView = TicketView()
    
    var ticket: TicketModel!
    var seats = ""
    var payedSeats: [SeatModel]!

    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
            super.viewDidLoad()
        
        
        timeLabel.text = ticket?.bus?.time
        dateLabel.text = ticket?.bus?.date
        toLabel.text = ticket?.bus?.cityTo
        fromLabel.text = ticket?.bus?.cityFrom
        nameLabel.text = (ticket?.passenger!.name)! + " " + (ticket?.passenger!.surname)!
        payedSeats = ticket.seat
        companyLabel.text = ticket.bus?.companyName
        
        for seat in payedSeats{
            seats += " \(seat.text)"
        }
        seatsLabel.text = seats
        
           /*
            view.addSubview(ticketView)

            // Some autolayout constraints
            ticketView.translatesAutoresizingMaskIntoConstraints = false
            ticketView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            ticketView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            ticketView.widthAnchor.constraint(equalToConstant: view.frame.width - 75).isActive = true
            ticketView.heightAnchor.constraint(equalToConstant: view.frame.height - 160).isActive = true
            */
        }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
