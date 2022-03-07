//
//  ErrorPopUpVC.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 21.02.2022.
//

import UIKit

class ErrorPopUpVC: UIViewController {
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    var errorMessages = [ErrorModel]()
    var errorMode = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        let msg1 = ErrorModel(message: "Sorry! Couldn't find the right bus for you!")
        let msg2 = ErrorModel(message: "Sorry! You can select only 5 seats")
        let msg3 = ErrorModel(message: "The seat you selected is already Sold!")
        let msg4 = ErrorModel(message: "Please check your personal information. Fill in all the necessary information.")
        errorMessages.append(msg1)
        errorMessages.append(msg2)
        errorMessages.append(msg3)
        errorMessages.append(msg4)
        
        



    }
    override func viewWillAppear(_ animated: Bool) {
        showError()
    }
    override func viewDidDisappear(_ animated: Bool) {
        errorMode = -1
    }
    func showError(){
        switch errorMode{
        case 0:
            errorMessageLabel.text = errorMessages[errorMode].message
        case 1:
            errorMessageLabel.text = errorMessages[errorMode].message
        case 2:
            errorMessageLabel.text = errorMessages[errorMode].message
        default:
            errorMessageLabel.text = errorMessages[errorMode].message
        }
        
    }
    

    @IBAction func okayButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
