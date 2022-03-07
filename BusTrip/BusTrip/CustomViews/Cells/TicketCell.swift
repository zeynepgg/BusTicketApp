//
//  TicketCell.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 22.02.2022.
//

import UIKit

class TicketCell: UICollectionViewCell {
    
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    
    func configure (model: TicketModel) {
        self.costLabel.text = String("\(model.cost) TL")
        self.timeLabel.text = model.bus?.time
        self.dateLabel.text = model.bus?.date
        self.toLabel.text = model.bus?.cityTo
        self.fromLabel.text = model.bus?.cityFrom
       // self.busTime.text = model.time
       // self.busPrice.text = "\(String(model.price)).00 TL"
    }
}
