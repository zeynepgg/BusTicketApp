//
//  BookedDestinationsVC.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 19.02.2022.
//

import UIKit

class BookedDestinationsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let notificationCenter: NotificationCenter = .default
    
    var tickets = [TicketModel]()
    var selectedTicket: TicketModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        
       
        
        /*for ticket in SharedTickets.bookedTickets{
            tickets.append(ticket)
        }*/
       // tickets = SharedTickets.bookedTickets
        
    }
    override func viewWillAppear(_ animated: Bool) {
       // print("2biletler:", tickets)
       /* for ticket in SharedTickets.sharedIntance.bookedTickets{
            tickets.append(ticket)
        
        }*/
        reloadView()
        print("Bu bilet sayısı: ",SharedTickets.bookedTickets.count)
    }
  /*  @objc func addTicket(notification: NSNotification) {
        print("BURAYADAYIMM")
        guard let userInfo = notification.userInfo else {return}
        if let ticket = userInfo["ticket"] as? TicketModel {
            self.tickets.append(ticket)
    
        }
    }*/
  /*  override func viewWillAppear(_ animated: Bool) {
        for ticket in SharedTickets.bookedTickets{
            //tickets.append(ticket)
            reloadView()
          
        
        }
        for i in tickets{
            print("\(i)\n")
        }
       //print("2biletler:", tickets)
       // notificationCenter.addObserver(self, selector: #selector(addTicket), name: .sendTicketNotification, object: nil)
    }*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTicket" {
            let destinationVC = segue.destination as! TicketVC
            destinationVC.ticket = selectedTicket
        }
    }
    func reloadView(){
        collectionView.reloadData()
    }

}

extension BookedDestinationsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        SharedTickets.bookedTickets.count
        //tickets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TicketCell", for: indexPath) as! TicketCell
        cell.configure(model: SharedTickets.bookedTickets[indexPath.row])
        //cell.configure(model: tickets[indexPath.row])
       /* if tickets.count > 0 {
        cell.configure(model: tickets[indexPath.row])
        }*/
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        return CGSize(width: bounds.width - 10, height: bounds.height / 6)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedTicket = SharedTickets.bookedTickets[indexPath.row]
        self.performSegue(withIdentifier: "goToTicket", sender: self)
        
    }
    
    
}
