//
//  MapView.swift
//  podong4cuts
//
//  Created by BAE on 2023/05/05.
//

import SwiftUI
import MapKit

struct MapView: View {
    //서울 좌표
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.058616, longitude: 129.382959),
        span: MKCoordinateSpan(latitudeDelta: 0.015,
                               longitudeDelta: 0.015))
    @State var tracking: MapUserTrackingMode = .follow
    @State var flags: Bool = false
    @State var offset: CGFloat = 0
    
    @StateObject var manager = LocationManager()
    
    var body: some View {
        VStack{
            ZStack{
//                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: $tracking)
//
                Map(coordinateRegion: $manager.region,
                    interactionModes: MapInteractionModes.all,
                    showsUserLocation: true,
                    userTrackingMode: $tracking)

                HStack {
                    VStack(alignment: .leading) {
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 45, height: 45)
                            Button(action: {
                                
                                print("hi \(flags)")
                                flags.toggle()
                            }) {
                                Image(systemName: "paperplane.circle.fill")
                            }
                                .font(.system(size: 45))
                                .foregroundColor(Color.black)
                        }
                        .padding([.top], 20)
                        
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 45, height: 45)
                            Button(action: {
                                print("bye \(flags)")
                                flags.toggle()
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
            
//            if flags {
//                Text("Clicked")
//            }
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
