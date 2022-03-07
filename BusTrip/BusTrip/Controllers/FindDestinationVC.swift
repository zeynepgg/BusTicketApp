//
//  FindDestinationVC.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 19.02.2022.
//

import UIKit



class FindDestinationVC: UIViewController {
    
    //outlets
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var toButton: UIButton!
    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var findButton: UIButton!
    
    //variables
    var fromCity: String?
    var toCity: String?
    var date: Date?
    var buses = [BusModel]()
    var searchedBuses = [BusModel]()
    let dateFormatter = DateFormatter()
    var dateString = String()
    var tempFromArray = [String]()
    var tempToArray = [String]()
    
    let notificationCenter: NotificationCenter = .default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .date
        
        notificationCenter.addObserver(self, selector: #selector(changeThings), name: .sendDataNotification, object: nil)
        addBuses()
        
        for bus in buses {
            if !tempFromArray.contains(bus.cityFrom){
                tempFromArray.append(bus.cityFrom)
            }
        }
        for bus in buses {
            if !tempToArray.contains(bus.cityTo){
                tempToArray.append(bus.cityTo)
            }
        }
        

        // Do any additional setup after loading the view.
    }
    func addBuses(){
        let bus1 = BusModel(cityFrom: "İstanbul", cityTo: "Ankara", date: "01.03.2022", time: "00:30", price: 90, soldSeats: ["3" : 1], id: 1, companyName: "Metro Turizm", companyImg: UIImage(named: "metro")!)
        let bus2 = BusModel(cityFrom: "İzmir", cityTo: "Konya", date: "28.02.2022", time: "13:30", price: 100, soldSeats: ["4" : 2], id: 2, companyName: "Metro Turizm", companyImg: UIImage(named: "metro")!)
        let bus3 = BusModel(cityFrom: "Zonguldak", cityTo: "İstanbul", date: "03.03.2022", time: "12:45", price: 100, soldSeats: ["5" : 1, "6": 2, "45": 2], id: 3, companyName: "Ulusoy", companyImg: UIImage(named: "ulusoy3")!)
        let bus4 = BusModel(cityFrom: "Antalya", cityTo: "Kayseri", date: "28.02.2022", time: "05:00", price: 150, soldSeats: ["19":1, "07": 2], id: 4, companyName: "Kamil Koç", companyImg: UIImage(named: "kamilkoc")!)
        let bus5 = BusModel(cityFrom: "İstanbul", cityTo: "Ankara", date: "01.03.2022", time: "10:00", price: 90, soldSeats: ["17" : 1, "18": 2, "3": 2], id: 5, companyName: "Asya Tur", companyImg: UIImage(named: "asya-tur")!)
        let bus6 = BusModel(cityFrom: "İstanbul", cityTo: "Ankara", date: "01.03.2022", time: "19:30", price: 90, soldSeats: ["3" : 1], id: 6, companyName: "Pamukkale Turizm", companyImg: UIImage(named: "pamukkaleturizm")!)
        buses.append(bus1)
        buses.append(bus2)
        buses.append(bus3)
        buses.append(bus4)
        buses.append(bus5)
        buses.append(bus6)
    }
    @objc func changeThings(notification: NSNotification) {
        fromButton.setTitle("Please Select...", for: .normal)
        toButton.setTitle("Please Select...", for: .normal)
        
        print("buraya girdim 1")
        guard let userInfo = notification.userInfo as? [String: Any] else {return}
        print("buraya girdim 2")
        if let busId = userInfo["busId"] as? Int {
            print("buraya girdim 3")
            for optionalBus in buses {
                var bus = optionalBus
                print("buraya girdim 4")
                if bus.id == busId {
                    print("buraya girdim 5")
                    if let soldSeats = userInfo["soldSeats"] as? [String: Int] {
                        print("buraya girdim 6")
                        soldSeats.forEach{bus.soldSeats[$0] = $1}
                        print("bu bus", bus)
                        buses.removeAll(where: { $0.id == optionalBus.id})
                        buses.append(bus)
                        
                    }
                }
            }
        }
        /*
        for bus in buses {
         var b = bus
         if b.id == busInformation.id {
             
             soldSeats.forEach{b.soldSeats[$0] = $1}
         }
        }*/
    }
    
    func getDate1(){
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateString = dateFormatter.string(from: datePicker.date)
    }
    func findDestination(){
        getDate1()
        print(dateString)
        for bus in buses {
           
            if bus.cityTo == toCity && bus.cityFrom == fromCity && bus.date == dateString{
                print("bulundu")
                print(bus)
                searchedBuses.append(bus)
            }
            
        }
        
        if searchedBuses.count > 0 {
            self.performSegue(withIdentifier: "goToBusListVC", sender: self)
        }else {
            self.performSegue(withIdentifier: "goToError", sender: self)
        }
    }
    

    @IBAction func fromButtonClicked(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "toFromCitiesVC", sender: self)
    }
    @IBAction func toButtonClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toToCitiesVC", sender: self)
    }
    @IBAction func findButtonClicked(_ sender: UIButton) {
        fromCity = fromButton.currentTitle
        toCity = toButton.currentTitle
        
        
        
        findDestination()
        searchedBuses.removeAll(keepingCapacity: false)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if segue.identifier == "goToBusListVC" {
            let destinationVC = segue.destination as! BusListVC
            destinationVC.buses = searchedBuses
            destinationVC.toCity = toCity!
            destinationVC.fromCity = fromCity!
            destinationVC.date = dateString
            
        }else if segue.identifier == "toFromCitiesVC" {
            let destinationVC = segue.destination as! CitiesVC
            destinationVC.delegate = self
            destinationVC.section = 1
            destinationVC.cities = tempFromArray.sorted{$0 < $1}
            
           
        }else if segue.identifier == "toToCitiesVC" {
            let destinationVC = segue.destination as! CitiesVC
            destinationVC.delegate = self
            destinationVC.section = 2
            destinationVC.cities = tempToArray.sorted{$0 < $1}
        }else if segue.identifier == "goToError" {
            let destinationVC = segue.destination as! ErrorPopUpVC
            destinationVC.errorMode = 0
        }
        
        
        

    }
    
}
extension FindDestinationVC: MessageDelegate {
    func sendCity(cityt: String, section: Int) {
        if section == 1 {
            fromButton.setTitle(cityt, for: .normal)
            print(section)
        }else{
            toButton.setTitle(cityt, for: .normal)
        }
    }
}


       
 
