//
//  MapView.swift
//  podong4cuts
//
//  Created by 이승용 on 2023/05/05.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 36.03709,
            longitude: 129.37887
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5
        )
    )
    
    @StateObject var manager = LocationManager()
    
    let MapLocations = [
            MapLocation(name: "영일교",
                        latitude: 36.06149,
                        longitude: 129.38306
                       ),
            MapLocation(name: "Space Walk",
                        latitude: 36.06437,
                        longitude: 129.38937
                       )
            ]
    
    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: MapInteractionModes.all,
            showsUserLocation: true,
            userTrackingMode: .constant(.follow),
            annotationItems: MapLocations,
            annotationContent: { locations in
                MapMarker(coordinate: locations.coordinate, tint: .red)
            }
        )
        
//        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: MapLocation.latitude, longitude: MapLocation.longitude)) {
//            VStack {
//                Image(systemName: "star.circle")
//                    .resizable()
//                    .foregroundColor(.red)
//                    .frame(width: 44, height: 44)
//                    .background(.white)
//                    .clipShape(Circle())
//
//                Text(MapLocation.name)
//            }
//        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
