//
//  HomeView.swift
//  podong4cuts
//
//  Created by Eric Lee on 2023/05/03.
//

import SwiftUI

struct HomeView: View {
    @State var index = 0
    
    // property
    @StateObject var VM: PodongViewModel = PodongViewModel()
    
    var body: some View {
//        TabView(selection:$index) {
//            MapView()
//                .tabItem {
//                    Image(systemName: "map.circle")
//                        .font(.system(size: 45))
//                }
//                .tag(0)
//            CameraView()
//                .tabItem {
//                    Image(systemName: "camera.circle")
//                        .font(.system(size: 45))
//                }
//                .tag(1)
//            FourCutStudioView()
//                .tabItem {
//                    Image(systemName: "film.circle")
//                        .font(.system(size: 45))
//                }
//                .tag(2)
//        }
        TabView{
            
            //1. MapView
            MapView(VM: self.VM, data: AppData.sampleAppData)
                .tabItem{
                    Image(systemName: "map.fill")
                    Text("영일대 맵")
                }
            
            //2. ImageListView
            FilterListView(VM: self.VM, data: AppData.sampleAppData)
                .tabItem{
                    Image(systemName: "photo.fill.on.rectangle.fill")
                    Text("필터")
                }
            
            //3. FourCutView
            FourCutView()
                .tabItem{
                    Image(systemName: "film")
                    Text("포동 네컷")
                }
        }//: TabView
    }//: body
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
