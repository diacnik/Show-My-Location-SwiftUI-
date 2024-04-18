//
//  LocationManager.swift
//  Show My Location (SwiftUI)
//
//  Created by Ian Kincaid on 4/18/24.
//

import Foundation
import MapKit

// class LocationManager contains all location-related delegate functions
class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    override init() {
        
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}
    
    extension LocationManager: CLLocationManagerDelegate {
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last
            else {
                return
            }
            self.location = location
        }
    }
