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
    //    MapView Reload 해야할 시 아래 variable 주석 해제 후 .id(reloadMapView)
    //    @State private var reloadMapView = false
    @StateObject var manager = LocationManager()
    @State private var currentLocationManager = CLLocationManager()
    @State private var annotations: [CoverButton] = []
    
    //goopy's code
    @ObservedObject var VM: PodongViewModel
   

    
    
    
    
    
    var body: some View {
        
        NavigationView{
                ZStack{
                    
                    // [2] Map Struct로 구현.
                        Map(coordinateRegion: $manager.region,
                            interactionModes: MapInteractionModes.all,
                            showsUserLocation: true,
                            userTrackingMode: $tracking,
                            annotationItems: annotations) { locations in
                                MapAnnotation(coordinate: locations.coordinate) {
                                    CustomCoverButton(VM: self.VM, selectedNumber: locations.selectedNumber)
                                        .onTapGesture {
                                            VM.selectedSpot = VM.spotdata[locations.selectedNumber]
                                            VM.spotdata[locations.selectedNumber].isDetailSheetPresented = true
                                        }//: onTapDesture
                                }
                            }
                            .onAppear {
                                addAnnotations()
                            }
                    
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            
                            // (1) 내 위치로 이동 버튼
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
                                          
                            // (2) 영일대로 이동 버튼
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
                            }//】 ZStack
                                      
                            Spacer()
                        }//】 VStack
                        .padding([.leading], 10)
                        
                        Spacer()
                    }//】 HStack
                }//】 ZStack
        }//】 Navigation
        .sheet(isPresented: $VM.spotdata[VM.selectedSpot!.number].isDetailSheetPresented) {
            if VM.selectedSpot != nil {
                DetailView(VM: PodongViewModel())
                    .environmentObject(PodongViewModel())
                    .presentationDetents([.medium, .large])
            }
        }//】 Sheet
}//: Struct
        
    
        // 내 위치 알려주는 함수
        func focusOnUserLocation() {
            guard let userLocation = currentLocationManager.location?.coordinate else { return }
            manager.region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015))
        }//】 func
        
        
    
        // 맵핀 배열에 추가하는 함수
        func addAnnotations(){
            self.annotations = [
                
                //[0] 스페이스워크
                CoverButton(
                    VM: self.VM,
                    coordinate: CLLocationCoordinate2D(
                                    latitude: self.VM.spotdata[0].latitude,
                                    longitude: self.VM.spotdata[0].longitude), selectedNumber: 0),
                
                //[1] 토마틸로
                CoverButton(
                    VM: self.VM,
                    coordinate: CLLocationCoordinate2D(
                                    latitude: self.VM.spotdata[1].latitude,
                                    longitude: self.VM.spotdata[1].longitude), selectedNumber: 1),
                
                //[2] 오브레맨
                CoverButton(
                    VM: self.VM,
                    coordinate: CLLocationCoordinate2D(
                                    latitude: self.VM.spotdata[2].latitude,
                                    longitude: self.VM.spotdata[2].longitude), selectedNumber: 2),
                
                //[3] 영일교
                CoverButton(
                    VM: self.VM,
                    coordinate: CLLocationCoordinate2D(
                                    latitude: self.VM.spotdata[3].latitude,
                                    longitude: self.VM.spotdata[3].longitude), selectedNumber: 3),
                
                //[4] 글로벌 신화
                CoverButton(
                    VM: self.VM,
                    coordinate: CLLocationCoordinate2D(
                                    latitude: self.VM.spotdata[4].latitude,
                                    longitude: self.VM.spotdata[4].longitude), selectedNumber: 4),
                
                //[5] 고래꼬리
                CoverButton(
                    VM: self.VM,
                    coordinate: CLLocationCoordinate2D(
                                    latitude: self.VM.spotdata[5].latitude,
                                    longitude: self.VM.spotdata[5].longitude), selectedNumber: 5)
                
            ]
            
        }//】 func
        
}


    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView(VM: PodongViewModel())
        }
    }

