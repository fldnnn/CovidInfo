//
//  CountryMapViewController.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import UIKit
import MapKit

class CountryMapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = UserDefaults.standard.string(forKey: "codeValue")
            
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            self.mapView.setRegion(response.boundingRegion, animated: true)
        }
    }
}
