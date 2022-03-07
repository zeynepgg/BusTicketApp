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
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        reloadView()
        print("Bu bilet sayısı: ",SharedTickets.bookedTickets.count)
    }
 
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
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TicketCell", for: indexPath) as! TicketCell
        cell.configure(model: SharedTickets.bookedTickets[indexPath.row])
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
