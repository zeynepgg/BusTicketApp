//
//  TicketView.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 22.02.2022.
//

import UIKit

@IBDesignable

class TicketView: UIView {

    override init(frame: CGRect) {
           super.init(frame: frame)
           
           backgroundColor = .white
           layer.cornerRadius = 18
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           backgroundColor = .white
           layer.cornerRadius = 18
       }
    
    override func layoutSubviews() {
      drawTicket()
    }

    private func drawTicket() {
        let ticketShapeLayer = CAShapeLayer()
          ticketShapeLayer.frame = self.bounds
        ticketShapeLayer.fillColor = UIColor.lightBlueColor.cgColor
        ticketShapeLayer.shadowColor = UIColor.gray.cgColor
        ticketShapeLayer.shadowRadius = 2
        ticketShapeLayer.shadowOpacity = 1
        
        
        let circleLeft = CAShapeLayer()
        circleLeft.fillColor = UIColor(red: 252, green: 153, blue: 124, alpha: 1).cgColor
        
        let circleRight = CAShapeLayer()
        circleRight.fillColor = UIColor(red: 252, green: 153, blue: 124, alpha: 1).cgColor
        
        
    
    
    

          let ticketShapePath = UIBezierPath(roundedRect: ticketShapeLayer.bounds, cornerRadius: 18)

          let topLeftArcPath = UIBezierPath(arcCenter: CGPoint(x: 0, y: 350),
                                            radius: 36 / 3,
                                            startAngle:  CGFloat(Double.pi / 2),
                                            endAngle: CGFloat(Double.pi + Double.pi / 2),
                                            clockwise: false)
        
          topLeftArcPath.close()
        

        let topRightArcPath = UIBezierPath(arcCenter: CGPoint(x: ticketShapeLayer.frame.width, y: 350),
                                           radius: 36 / 3,
                                           startAngle:  CGFloat(Double.pi / 2),
                                           endAngle: CGFloat(Double.pi + Double.pi / 2),
                                           clockwise: true)
         topRightArcPath.close()
        circleLeft.path = topLeftArcPath.cgPath
        circleRight.path = topRightArcPath.cgPath
        layer.addSublayer(circleRight)
        layer.addSublayer(circleLeft)
         ticketShapePath.append(topLeftArcPath)
         ticketShapePath.append(topRightArcPath.reversing())
        

         ticketShapeLayer.path = ticketShapePath.cgPath
         layer.addSublayer(ticketShapeLayer)

    }
}

