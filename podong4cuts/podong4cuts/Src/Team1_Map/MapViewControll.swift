//
//  MapViewControll.swift
//  podong4cuts
//
//  Created by BAE on 2023/05/05.
//

import SwiftUI
import MapKit

struct MapViewControll: View {
    @StateObject var manager = LocationManager()
    @State private var reloadMapView = false
    
    var body: some View {
        ZStack{
            let currentMap = MapView().id(reloadMapView)
            currentMap
            
            Button("test") {
                print("SSIBAL")
                reloadMapView.toggle()
            }
        }
    }
}

struct MapViewControll_Previews: PreviewProvider {
    static var previews: some View {
        MapViewControll()
    }
}
