//
//  HomeView.swift
//  podong4cuts
//
//  Created by Eric Lee on 2023/05/03.
//

import SwiftUI


struct HomeView: View {
    
    // property
    @ObservedObject var VM: PodongViewModel

    
    var body: some View {

        TabView{
            
            //1. MapView
            MapView(VM: self.VM)
                .tabItem{
                    Image(systemName: "map.fill")
                    Text("영일대 맵")
                }
            
            //2. ImageListView
            FilterListView(VM: self.VM)
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
        HomeView(VM: PodongViewModel())
    }
}

