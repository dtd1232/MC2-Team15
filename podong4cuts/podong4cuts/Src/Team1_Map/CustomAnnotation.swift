//
//  CustomAnnotation.swift
//  podong4cuts
//
//  Created by BAE on 2023/05/08.
//

import SwiftUI
import MapKit
import CoreLocation

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

