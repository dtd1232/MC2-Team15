//
//  HomeView.swift
//  podong4cuts
//
//  Created by Eric Lee on 2023/05/03.
//

import SwiftUI

struct HomeView: View {
    @State var index = 0
    
    var body: some View {
        TabView(selection:$index) {
            MapViewControll()
                .tabItem {
                    Image(systemName: "map.circle")
                        .font(.system(size: 45))
                }
                .tag(0)
            CameraView()
                .tabItem {
                    Image(systemName: "camera.circle")
                        .font(.system(size: 45))
                }
                .tag(1)
            FourCutStudioView()
                .tabItem {
                    Image(systemName: "film.circle")
                        .font(.system(size: 45))
                }
                .tag(2)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
