//
//  CoverButton.swift
//  Podong
//
//  Created by Koo on 2023/05/05.
//

import SwiftUI
import CoreLocation
import MapKit

class CoverButton: NSObject, MKAnnotation, Identifiable {
    
    //property
    @ObservedObject var VM: PodongViewModel
    var coordinate: CLLocationCoordinate2D
    var number: Int
    
    init(VM: PodongViewModel, coordinate: CLLocationCoordinate2D, number: Int) {
        
        self.VM = VM
        self.coordinate = coordinate
        self.number = number
        
    }
    
}//: Class
