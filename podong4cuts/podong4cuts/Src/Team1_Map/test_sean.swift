//
//  test_sean.swift
//  podong4cuts
//
//  Created by BAE on 2023/05/04.
//

import SwiftUI
import MapKit

struct test_sean: View {
    //서울 좌표
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.058616, longitude: 129.382959),
        span: MKCoordinateSpan(latitudeDelta: 0.015,
                               longitudeDelta: 0.015))
    @State var flags: Bool = false
    @State var offset: CGFloat = 0
    
    var body: some View {
        VStack{
            ZStack{
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                Button(action: {
                    print("hi")
                    flags.toggle()
                }) {
                    Image(systemName: "paperplane.circle.fill")
                }
                    .font(.title)
                    .offset()
            }
            
            if flags {
                Text("Clicked")
            }
        }
        
    }
}

struct test_sean_Previews: PreviewProvider {
    static var previews: some View {
        test_sean()
    }
}
