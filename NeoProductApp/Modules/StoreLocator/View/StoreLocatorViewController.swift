//
//  StoreLocatorViewController.swift
//  NeoProductApp
//
//  Created by Neo on 16/07/24.
//

import UIKit
import MapKit

class StoreLocatorViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var storeMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupMap()
        setTitle("Store Locator")
    }
    
    func setupMap() {
        let initialLocation = CLLocation(latitude: 37.7749, longitude: -122.4194)
        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        storeMapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.title = "San Francisco"
        annotation.coordinate = initialLocation.coordinate
        storeMapView.addAnnotation(annotation)
    }
}

extension StoreLocatorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreLocatorTableViewCell") as?  StoreLocatorTableViewCell
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
