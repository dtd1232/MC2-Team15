//
//  TempARViewContainer.swift
//  podong4cuts
//
//  Created by user on 2023/05/10.
//

import Foundation

import Foundation
import SwiftUI
import RealityKit
import ARKit
import CoreImage

struct TempARViewContainer: UIViewRepresentable {
    var arView: ARView
    
    init() {
        arView = ARView(frame: .zero)
        
    }
    
    func makeUIView(context: Context) -> ARView {
        
//        arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        let configuration = ARWorldTrackingConfiguration()
        arView.session.run(configuration)
        
        return arView
    }
    
    func updateUIView(_ arView: ARView, context: Context) {}
    
    
    
    func takeSnapShot(center: CGPoint, width: CGFloat, height: CGFloat) {
        DispatchQueue.global(qos: .userInitiated).async {
            arView.snapshot(saveToHDR: false) { (image) in
//                print(image!.size.width)
//                print(image!.size.height)
//                print(width, height)
                let compressedImage = UIImage(data: (image?.pngData())!)
                let croppedImage = compressedImage?.crop(rect: CGRect(x: center.x, y: center.y, width: width*3, height: height*3))
//                let croppedImage = cropImage(center: center, width: width, height: height, inputImage: compressedImage!)
                UIImageWriteToSavedPhotosAlbum(croppedImage!, nil, nil, nil)
            }
        }
    }
    
    func cropImage(center: CGPoint, width: CGFloat, height: CGFloat, inputImage: UIImage)-> UIImage? {
        let cropZone = CGRect(x: center.x, y: center.y, width: width, height: height)
        
        guard let cutImageRef: CGImage = inputImage.cgImage?.cropping(to: cropZone) else { return nil}
        return UIImage(cgImage: cutImageRef, scale: inputImage.imageRendererFormat.scale, orientation: inputImage.imageOrientation)
    }
    
    func saveSnapShot(snapShot: UIImage) {
        UIImageWriteToSavedPhotosAlbum(snapShot, nil, nil, nil)
    }
    
    
    func reRun() {
        let config = ARWorldTrackingConfiguration()
        arView.session.run(config)
    }
}
