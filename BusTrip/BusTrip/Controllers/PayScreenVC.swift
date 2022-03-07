//
//  PayScreenVC.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 21.02.2022.
//

import UIKit

protocol SeatInfoDelegate {
    func sendBooking(isPayed: Bool, seatDict: [String:Int])
}
class PayScreenVC: UIViewController {
    
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var delegate: SeatInfoDelegate?
    var busInformation: BusModel?
    var selectedSeats: [SeatModel]!
    
    var soldSeats: [String : Int] = [:]
    
    var passenger = Passenger()
    var ticket = TicketModel()
    
    var cost = Int()
    var seatsString = ""
    
    
    var isPayed = false

    override func viewDidLoad() {
        super.viewDidLoad()
        fromLabel.text = busInformation?.cityFrom
        toLabel.text = busInformation?.cityTo
        dateLabel.text = busInformation?.date
        timeLabel.text = busInformation?.time
        companyLabel.text = busInformation?.companyName
        
        costLabel.text = String(cost) + " TL"
        // Do any additional setup after loading the view.
        for seat in selectedSeats {
            
            seatsString = seatsString + " \(seat.text)"
        }
        print(seatsString)
        seatsLabel.text = seatsString
    }
    
    func createDict() {
        for seat in selectedSeats {
            soldSeats["\(seat.text)"] = seat.gender
        }
        print(soldSeats)
        
    }
   
    func createTicket(){
        ticket.passenger = passenger
        ticket.bus = busInformation
        ticket.seat = selectedSeats
        ticket.numberOfSeats = selectedSeats.count
        ticket.cost = cost
        
        SharedTickets.bookedTickets.append(ticket)
        print("pay screen: ", SharedTickets.bookedTickets)
    }
    @IBAction func okayButtonClicked(_ sender: UIButton) {
        if nameTextField.text != "" && surnameTextField.text != "" && idTextField.text != "" {
            passenger.name = nameTextField.text!
            passenger.surname = surnameTextField.text!
            passenger.id = idTextField.text!
            createTicket()
            createDict()
            isPayed = true
            self.delegate?.sendBooking(isPayed: isPayed, seatDict: soldSeats)
            
            self.performSegue(withIdentifier: "goToConfirmPopUpVC", sender: self)
        }else{
            self.performSegue(withIdentifier: "goToError", sender: self)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToError" {
            let destinationVC = segue.destination as! ErrorPopUpVC
            destinationVC.errorMode = 3
        }else if segue.identifier == "goToConfirmPopUpVC" {
            let destinationVC = segue.destination as! ConfirmPopUpVC
            destinationVC.ticket = self.ticket
        }
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
