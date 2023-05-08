//
//  MapLocation.swift
//  podong4cuts
//
//  Created by 이승용 on 2023/05/05.
//

import UIKit
import MapKit

struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
