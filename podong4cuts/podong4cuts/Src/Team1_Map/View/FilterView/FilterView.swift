//
//  FilterListView.swift
//  Podong
//
//  Created by Koo on 2023/05/05.
//

import SwiftUI

struct FilterListView: View {
    
    //property
    @ObservedObject var VM: PodongViewModel
    let data: AppData
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: nil ),
        GridItem(.flexible(), spacing: 0, alignment: nil )]
    
    
    var body: some View {
        VStack(spacing: 0){
            
            LazyVGrid(columns: columns) {
                ForEach(VM.spotdata){ index in
                    
                    ZStack{
                        Color.gray.opacity(0.5)
                        
                        Image(systemName: "lock.fill")
                            .font(.title)
                            .foregroundColor(.black.opacity(0.3))
                            
                        Image(index.cover)
                            .resizable()
                            .scaledToFill()
                            .opacity(index.isOpened ? 1.0 : 0)
                        
                    }//】 ZStack
                    .frame(width: 170, height: 180)
                    .cornerRadius(15)
                }//】 Loop
            }//】 Grid
            .padding(.horizontal)
            
            
//
        }//】 VStack
    }//】 Body
}

struct FilterListView_Previews: PreviewProvider {
    static var previews: some View {
        FilterListView(VM: PodongViewModel(), data: AppData.sampleAppData)
    }
}

