//
//  CoverButton.swift
//  Podong
//
//  Created by Koo on 2023/05/05.
//

import SwiftUI

struct CoverButton: View {
    
    //property
    @ObservedObject var VM: PodongViewModel
    let data: AppData
    var number: Int = 0
    
    var body: some View {
        
        VStack{
            ZStack{
                Circle()
                    .frame(width: 50)
                    .foregroundColor(.white)
                    .shadow(color: VM.spotdata[number].isOpened ? Color.green.opacity(0.8) : Color.red.opacity(0.8),
                            radius: 4, y:2)
                    
                Image(data.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }//: ZStack
            Text(data.name)
                .foregroundColor(.gray)
                .font(.subheadline)
            
        }//: VStack
        
        
    }//: Body
}

struct CoverButton_Previews: PreviewProvider {
    static var previews: some View {
        CoverButton(VM: PodongViewModel(), data: AppData.sampleAppData, number: 0)
    }
}

