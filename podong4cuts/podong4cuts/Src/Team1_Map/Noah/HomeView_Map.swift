//
//  HomeView_Map.swift
//  podong4cuts
//
//  Created by 이승용 on 2023/05/05.
//

import SwiftUI

struct HomeView_Map: View {
    
    init() {
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    
//    private func presentModal(){
//        let detailViewController = DetailViewController()
//    }
    
    var body: some View {
        ZStack{
            TabView{
                MapView()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
                CameraView()
                    .tabItem {
                        Image(systemName: "camera")
                        Text("Camera")
                    }
                FourCutStudioView()
                    .tabItem {
                        Image(systemName: "photo.stack")
                        Text("4cuts")
                    }
            }
        }
    }
}

struct HomeView_Map_Previews: PreviewProvider {
    static var previews: some View {
        HomeView_Map()
    }
}
