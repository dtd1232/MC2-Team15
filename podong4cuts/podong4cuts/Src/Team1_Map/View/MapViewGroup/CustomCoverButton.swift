//
//  CustomCoverButton.swift
//  podong4cuts
//
//  Created by Koo on 2023/05/11.
//

import SwiftUI

struct CustomCoverButton: View {
    
    //property
    @ObservedObject var VM: PodongViewModel
    
    
    
    var body: some View {
            
        
            
            if (VM.spotdata[VM.selectedNumber].isDetailSheetPresented){
                VStack(spacing: 0){
                    ZStack{
                        
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 96)
                            .shadow(color: Color.gray.opacity(0.7),radius: 5, y:6)
                        
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.yellow,Color.pink]),
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )
                            .frame(width: 88)
                        
                        Image(VM.spotdata[VM.selectedNumber].cover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 60))
                        
                        
                    }//: ZStack
                    Image(systemName: "triangle.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(.white)
                        .rotationEffect(Angle(degrees: 180))
                        .frame(width: 13, height: 13)
                        .offset(y: -3)
                    
                    Text(VM.spotdata[VM.selectedNumber].name)
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .font(.subheadline)
                }//: VStack
                
            } else {
                
                
                
                VStack(spacing: 0){
                    ZStack{
                        
                        Circle()
                            .frame(width: 50)
                            .foregroundColor(.white)
                            .shadow(color: VM.spotdata[VM.selectedNumber].isOpened ? Color.green.opacity(0.7) : Color.red.opacity(0.8),
                                    radius: 5, y:6)
                        
                        Image(VM.spotdata[VM.selectedNumber].cover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }//: ZStack
                    Image(systemName: "triangle.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(.white)
                        .rotationEffect(Angle(degrees: 180))
                        .frame(width: 10, height: 10)
                        .offset(y: -3)
                    
                    Text(VM.spotdata[VM.selectedNumber].name)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }//: VStack
                
            }//: 조건문
        
    }//】 Body
}

struct CustomCoverButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomCoverButton(VM: PodongViewModel())
    }
}

