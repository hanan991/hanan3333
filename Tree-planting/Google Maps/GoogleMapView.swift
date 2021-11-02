//
//  GoogleMapView.swift
//  Tree-planting
//
//  Created by Ahmed Alharbi on 23/09/1442 AH.
//

import SwiftUI
import GoogleMaps

// الفيو ل Google Maps لا يمكن يتوافق مباشرة مع الفيو ل SwiftUI فلذلك اضفنا البروتوكول UIViewRepresentable علشان يتوافق معنا
struct GoogleMapsView: UIViewRepresentable {
    // 1
    
    @ObservedObject var locationManager = LocationManager()
    private let zoom: Float = 15.0
    
    // 2
    
    

    
    func makeUIView(context: Self.Context) -> GMSMapView {
        
        let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 26.709850, longitude: 50.042404)
        marker.map = mapView
        marker.title = "Ras Tanura"
        marker.snippet = "Saudi Arabia"
        
        return mapView
    }
    
    
    
    // 3
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: zoom)
        mapView.camera = camera
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude))
    }
    
}

extension GMSCameraPosition  {
    static var myLocation = GMSCameraPosition.camera(withLatitude: 26.709850, longitude: 50.042426, zoom: 100)
    
    
}








struct GoogleMapView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView()
    }
}
