//
//  ContentView.swift
//  Show My Location (SwiftUI)
//
//  Created by Ian Kincaid on 4/18/24.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var locationManager = CLLocationManager()
    
    func setupManager() {
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
    }
    
    func makeUIView(context: Context) -> MKMapView {
        setupManager()
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
}

struct ContentView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
        
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate: CLLocationCoordinate2D()
        return
        
        VStack {
            Text("Show My Location")
                .fontWeight(.bold)
                .font(.largeTitle)
            
            MapView()
            
            Text("Your Coordinates")
                .font(.title)
                .padding(.top, 10)
            
            HStack {
                
                Text("Latitude:")
                    .fontWeight(.bold)
                Text("\(coordinate.latitude)")
                    .fontWeight(.bold)
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .padding(.top, 10)
            
            HStack {
                
                Text("Longitude:")
                    .fontWeight(.bold)
                Text("\(coordinate.longitude)")
                    .fontWeight(.bold)
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 10)
        }
        .padding()
    }
}

/*#Preview {
    ContentView()
}*/
