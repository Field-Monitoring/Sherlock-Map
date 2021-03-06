//
//  MapViewController.swift
//  Field Monitoring
//
//  Created by Ajith Panneerselvam on 21/07/17.
//  Copyright © 2017 R.M.K. Engineering College. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    var lat : Double?
    var long : Double?
    var address: String?
    var mapContent : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: lat!, longitude: long!, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
        marker.title = address
        marker.snippet = mapContent
        marker.map = mapView
    }
}
