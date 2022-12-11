//
//  CountrySelectionViewController.swift
//  CovidInfo
//
//  Created by Fulden Onan on 9.12.2022.
//

import UIKit

class CountrySelectionViewController: UIViewController {
    
    @IBOutlet weak var countrySelectionTableView: UITableView!
    @IBOutlet weak var countrySelectionSearchBar: UISearchBar!
    
    var countryList = [Country]()
    var countryPresenterObject: ViewToPresenterCountrySelectionProcotol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countrySelectionTableView.delegate = self
        countrySelectionTableView.dataSource = self
        countrySelectionSearchBar.delegate = self
        
        CountrySelectionRouter.createModule(ref: self)
        
        countryPresenterObject?.viewDidLoad()

        countrySelectionTableView.register(UINib(nibName: "CountrySelectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CountrySelectionTableViewCell")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let country = sender as? Country {
                let detailVC = segue.destination as! DetailRecoveredViewController
                detailVC.country = country
            }
        }
    }
}

extension CountrySelectionViewController: PresenterToViewCountrySelectionProcotol {
    func updateView(with countries: [Country]) {
        self.countryList = countries
        self.countrySelectionTableView.reloadData()
    }
}

extension CountrySelectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            countryPresenterObject?.viewDidLoad()
        }else{
            countryPresenterObject?.onSearchButtonPressed(with: searchText)
        }
    }
}

extension CountrySelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countryList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountrySelectionTableViewCell", for: indexPath) as! CountrySelectionTableViewCell
        
        cell.countryNameLabel.text = country.iso3166_1
        cell.confirmedCountLabel.text = "Confirmed: \(country.cnt_confirmed ?? 0)"
        cell.recoveredCountLabel.text = "Recovered: \(country.cnt_recovered ?? 0)"
        cell.deathCountLabel.text = "Death: \(country.cnt_death ?? 0)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countryList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: country)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
