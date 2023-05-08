//
//  MapView.swift
//  Podong
//
//  Created by Koo on 2023/05/05.
//

import SwiftUI

struct MapView_2: View {
    
    //property
    @ObservedObject var VM: PodongViewModel
    let data: AppData

    @State private var selectedSpot: AppData? = nil
    @State private var isDetailSheetPresented : Bool = false
    
    var body: some View {
        NavigationView {
                VStack{
                    ForEach(VM.spotdata){ value in
                        CoverButton(VM: self.VM, data: value, number: value.number)
                            .simultaneousGesture(TapGesture().onEnded {
                                selectedSpot = value
                                isDetailSheetPresented = true
                            })
                    }//】 Loop
                }//】 VStack
                .sheet(isPresented: $isDetailSheetPresented) {
                    if let spot = selectedSpot {
                        DetailView(VM: self.VM, data: spot, number: spot.number)
                            .presentationDetents([.medium, .large])
                    }
                }//】 Sheet
        }//】 Navigation
    }//】 Body
}

struct MapView_2_Previews: PreviewProvider {
    static var previews: some View {
        MapView_2(VM: PodongViewModel(), data: AppData.sampleAppData)
    }
}
