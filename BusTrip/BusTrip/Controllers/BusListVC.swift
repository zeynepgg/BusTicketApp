//
//  BusListVC.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 19.02.2022.
//

import UIKit

class BusListVC: UIViewController {
    //variables
    var buses = [BusModel]()
    var date = ""
    var fromCity = ""
    var toCity = ""
    var selectedBus: BusModel?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        changeHeader()

        // Do any additional setup after loading the view.
    }
    
    func changeHeader(){
        dateLabel.text = date
        fromLabel.text = fromCity
        toLabel.text = toCity
    }
    

    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSeatsVC" {
            let destinationVC = segue.destination as! SeatsVC
            destinationVC.bus = selectedBus
        }
    }
   

}
extension BusListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        buses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BusCell", for: indexPath) as! BusCell
        cell.configure(model: buses[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        return CGSize(width: bounds.width - 10, height: bounds.height / 6)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedBus = buses[indexPath.row]
        self.performSegue(withIdentifier: "goToSeatsVC", sender: self)
    }
}
