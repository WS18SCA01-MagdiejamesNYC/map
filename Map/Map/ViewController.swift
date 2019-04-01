//
//  ViewController.swift
//  Map
//
//  Created by James Charrel on 3/30/19.
//  Copyright © 2019 James Charrel. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    
    
    @IBOutlet weak var map: MKMapView!
    
    
    let initialLocation = CLLocation(latitude: 40.705725, longitude: -74.013966)
    let searchRadius: CLLocationDistance = 250
    
    let secondeLocation = CLLocation(latitude: 40.705018, longitude: -74.013651)
    
    let thirdLocation = CLLocation(latitude: 40.704308, longitude: -74.012950)
    
   
    
   
    
    
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.delegate = self
        
        let coordinateRegion = MKCoordinateRegion.init(center: initialLocation.coordinate, latitudinalMeters: searchRadius * 2.0, longitudinalMeters: searchRadius * 2.0)
        map.setRegion(coordinateRegion, animated: true)
        
        
        
        
        let annotation = MKPointAnnotation()
        annotation.title = "BMCC"
        annotation.subtitle = "Best Coding Class Ever"
        annotation.coordinate = initialLocation.coordinate
        map.addAnnotation(annotation)
        
        
        let annotation2 = MKPointAnnotation()
        annotation2.title = "Hot Dog Cart"
        annotation2.subtitle = "Mark's Place?"
        annotation2.coordinate = secondeLocation.coordinate
        map.addAnnotation(annotation2)
        
        let annotation3 = MKPointAnnotation()
        annotation3.title = "Chipotle"
        annotation3.subtitle = "Balmes and Antonios' Place?"
        annotation3.coordinate = thirdLocation.coordinate
        map.addAnnotation(annotation3)
        
        let myPlace = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        myPlace.minimumPressDuration = 2
        
        map.addGestureRecognizer(myPlace)
        
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "New place"
        
        annotation.subtitle = "This is my favorite place..."
        
        map.addAnnotation(annotation)
        
    }
    
    
        
     
    
}

