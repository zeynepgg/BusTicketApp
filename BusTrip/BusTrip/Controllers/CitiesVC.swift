//
//  CitiesVC.swift
//  BusTrip
//
//  Created by Zeynep Gizem Gürsoy on 19.02.2022.
//

import UIKit

protocol MessageDelegate {
    func sendCity(cityt: String, section: Int)
}

class CitiesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var delegate: MessageDelegate?

    var cities = [String]()
    var filteredCities = [String]()
    var isFiltering: Bool = false
    var city: String = ""
    var section = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.backgroundColor = UIColor(red: 218, green: 221, blue: 252, alpha: 1.5)
        //searchBar.barTintColor = UIColor(red: 46, green: 76, blue: 109, alpha: 1.5)
        tableView.backgroundView = nil
        tableView.backgroundColor = .likeBlueWhiteColor
        //tableView.backgroundColor = UIColor(red: 218, green: 221, blue: 252, alpha: 1.5)
       

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        setupEmptyBackgroundView()
        print(cities)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        cities.removeAll(keepingCapacity: false)
    }
    func setupEmptyBackgroundView(){
            let emptyBackgroundView = EmptyView()
            tableView.backgroundView = emptyBackgroundView
        }
    



}
extension CitiesVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            if filteredCities.count == 0 {
                tableView.separatorStyle = .none
                tableView.backgroundView?.isHidden = false
            }else{
                tableView.separatorStyle = .singleLine
                tableView.backgroundView?.isHidden = true
            }
            return filteredCities.count
        }
        if cities.count == 0 {
            tableView.separatorStyle = .none
            tableView.backgroundView?.isHidden = false
        }else {
            tableView.separatorStyle = .singleLine
            tableView.backgroundView?.isHidden = true
        }
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell")
        
        
        if isFiltering{
            city = filteredCities[indexPath.row]
        }else {
            city = cities[indexPath.row]
        }
        cell?.textLabel?.text = city
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(cities[indexPath.row]) seçildi")
        print(section)
        if isFiltering{
            city = filteredCities[indexPath.row]
        }else {
            city = cities[indexPath.row]
        }
        self.delegate?.sendCity(cityt: city, section: section)
        //önceki ekrana dönmek için
        dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
}

extension CitiesVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updateSearchResults(searchText: searchText)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    func updateSearchResults(searchText: String) {
        if searchText.isEmpty {
            filteredCities.removeAll()
            isFiltering = false
            tableView.reloadData()
        }else{
            filteredCities = cities.filter({(city: String) -> Bool in
                return city.lowercased().contains(searchText.lowercased())
            })
            
            isFiltering = true
            tableView.reloadData()
        }
    }
}
