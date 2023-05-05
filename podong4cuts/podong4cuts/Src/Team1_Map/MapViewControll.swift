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
    
    var body: some View {
        ZStack{
            MapView()
            
            Button("test") {
                print("SSIBAL")
            }
        }
    }
}

struct MapViewControll_Previews: PreviewProvider {
    static var previews: some View {
        MapViewControll()
    }
}
