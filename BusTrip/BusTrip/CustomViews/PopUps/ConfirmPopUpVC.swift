//
//  ConfirmPopUpVC.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 21.02.2022.
//

import UIKit



class ConfirmPopUpVC: UIViewController {
    var ticket: TicketModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func showTicketButtonClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToTicket", sender: self)
    }
    @IBAction func goHomeClicked(_ sender: UIButton) {
    
        self.view.window!.rootViewController?.presentedViewController?.dismiss(animated: true, completion: nil)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTicket" {
            let destinationVC = segue.destination as! TicketVC
            destinationVC.ticket = ticket
        }
    }

}
