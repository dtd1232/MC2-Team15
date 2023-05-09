//
//  CameraFrameView.swift
//  podong4cuts
//
//  Created by user on 2023/05/10.
//

import SwiftUI
import RealityKit
import ARKit

struct CameraFrameView: View {
    
    @State private var geoWidth = 0.0
    @State private var geoHeight = 0.0
    @State private var geoPosition = CGPoint()
    
    let arViewContainer = TempARViewContainer()
    
    var body: some View {
        ZStack {
            arViewContainer
                .background(.white)
                .overlay (
                        VStack {
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "speaker.fill")
                                }
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "bolt.fill")
                                }
                            }
                            .padding(.horizontal,30)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                            
                            GeometryReader { geo in
                                Spacer()
                                    .onAppear {
                                        geoWidth = geo.frame(in: .global).width
                                        geoHeight = geo.frame(in: .global).height
                                        geoPosition = geo.frame(in:CoordinateSpace .global).origin
                                    }
                            }
//                            GeometryReader{ geo in
//                                Rectangle()
//                                    .fill(.clear)
//                                    .onAppear {
//                                        print(geo.frame(in: .global).origin)
//                                        print(geo.frame(in: .global).maxX)
//                                        print(geo.frame(in: .global).maxY)
//                                    }
//                            }
                            
                            HStack {
                                Button {
                                    print(geoWidth)
                                    print(geoHeight)
                                    print(geoPosition)
                                    arViewContainer.takeSnapShot(center: geoPosition, width: geoWidth, height: geoHeight)
                                } label: {
                                    
                                    
                                    ZStack {
                                        Circle()
                                            .frame(width: 65, height: 65)
                                        Circle()
                                            .stroke(lineWidth: 5)
                                            .frame(width: 75, height: 75)
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                        }
            )
        }
        .onTapGesture { location in
            print(location)
        }
            
    }
}

extension UIImage {
    func crop(rect: CGRect) -> UIImage? {
        var scaledRect = rect
        scaledRect.origin.x *= scale
        scaledRect.origin.y *= scale
        scaledRect.size.width *= scale
        scaledRect.size.height *= scale
        
        guard let imageRef: CGImage = cgImage?.cropping(to: scaledRect) else {
            return nil
        }
        
        return UIImage(cgImage: imageRef, scale: scale, orientation: imageOrientation )
    }
}

struct CameraFrameView_Previews: PreviewProvider {
    static var previews: some View {
        CameraFrameView()
    }
}
