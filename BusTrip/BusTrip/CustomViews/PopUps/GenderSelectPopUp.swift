//
//  GenderSelectPopUp.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 21.02.2022.
//

import UIKit

protocol GenderDelegate {
    func sendGender(gender: Int)
}

class GenderSelectPopUp: UIViewController {
    
    var delegate: GenderDelegate?
    var gender = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func womanButtonClicked(_ sender: UIButton) {
        gender = 1
        self.delegate?.sendGender(gender: 1)
        dismiss(animated: true, completion: nil)
        //print(gender)
    }
    
    @IBAction func manButtonClicked(_ sender: UIButton) {
        gender = 2
        self.delegate?.sendGender(gender: 2)
        dismiss(animated: true, completion: nil)
        //print(gender)
    }
}
