//
//  MapView.swift
//  podong4cuts
//
//  Created by BAE on 2023/05/05.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    //    @State private var region = MKCoordinateRegion(
    //        center: CLLocationCoordinate2D(latitude: 36.058616, longitude: 129.382959),
    //        span: MKCoordinateSpan(latitudeDelta: 0.015,
    //                               longitudeDelta: 0.015))
    //    @State var offset: CGFloat = 0
    @State var tracking: MapUserTrackingMode = .follow
    //    @State var flags: Bool = false
    //    @State private var reloadMapView = false
    @StateObject var manager = LocationManager()
    @State private var currentLocationManager = CLLocationManager()
    @State private var annotations: [CustomAnnotation] = []
    
    var body: some View {
        VStack{
            ZStack{
                MapViewModel(region: $manager.region, annotations: annotations)
                    .onAppear{
                        addAnnotations()
                    }
                //                Map(coordinateRegion: $manager.region,
                //                    interactionModes: MapInteractionModes.all,
                //                    showsUserLocation: true,
                //                    userTrackingMode: $tracking,
                //                    annotationItems: MapLocations) { locations in
                //                    MapMarker(coordinate: locations.coordinate, tint: .red)
                //                }
                
                HStack {
                    VStack(alignment: .leading) {
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 45, height: 45)
                            
                            //TODO : 애플 지도 참조해서 버튼 디자인 리팩토링
                            Button(action: {
                                focusOnUserLocation()
                            }) {
                                Image(systemName: "location.circle.fill")
                            }
                            .font(.system(size: 45))
                            .foregroundColor(Color.black)
                        }
                        .padding([.top], 20)
                        
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 45, height: 45)
                            
                            Button (action: {
                                manager.region.center = CLLocationCoordinate2D(latitude: 36.058616, longitude: 129.382959)
                                manager.region.span = MKCoordinateSpan(
                                    latitudeDelta: 0.015,
                                    longitudeDelta: 0.015)
                            }) {
                                Image(systemName: "mappin.circle.fill")
                            }
                            .font(.system(size: 45))
                            .foregroundColor(Color.black)
                        }
                        
                        Spacer()
                    }
                    .padding([.leading], 10)
                    
                    Spacer()
                }
            }
        }
    }
    
    func focusOnUserLocation() {
        guard let userLocation = currentLocationManager.location?.coordinate else { return }
        manager.region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015))
    }
    
    func addAnnotations(){
        // Create your custom annotations here
        let MapLocations = [
            CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: 36.06149, longitude: 129.38306), title: "영일교", subtitle: "Subtitle 1"),
            CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: 36.06437, longitude: 129.38937), title: "Space Walk", subtitle: "Subtitle 2"),
        ]
        
        // Add the annotations to the array
        //        annotations.append(MapLocations)
        annotations.append(contentsOf: MapLocations)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
