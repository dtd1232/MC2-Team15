//
//  YoungIlDaeFaceTrackingViewController.swift
//  podong4cuts
//
//  Created by user on 2023/05/10.
//

import Foundation

import UIKit
import RealityKit
import ARKit

class YoungIlDaeFaceTrackingViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
//    let model01 = try! Entity.load(named: "Paperbag_Mask")
    let model01 = try! Entity.load(named: "Floating_Fox")
//    let model02 = try! Experience.loadBox()
//    let model02 = try! Entity.load(named: "Floating_Fox")
    let model02 = try! Experience.loadBox()
    let model03 = try! Entity.load(named: "Paperbag_Mask")
    
    lazy var models: [Any] = [self.model01, self.model02, self.model03]

    override func viewDidLoad() {
        super.viewDidLoad()

        
//        arView = ARView()
        
        arView = setupARView()
        view.addSubview(arView)
        NSLayoutConstraint.activate([
            arView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            arView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            arView.topAnchor.constraint(equalTo: view.topAnchor),
            arView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARFaceTrackingConfiguration()
        configuration.maximumNumberOfTrackedFaces = 3
        arView.contentScaleFactor = 0.75 * arView.contentScaleFactor
        arView.session.run(configuration)
    }
    
    func setupARView() -> ARView {
        let frameRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let arView = ARView(frame: frameRect)
        arView.session.delegate = self
        arView.translatesAutoresizingMaskIntoConstraints = false
        return arView
    }
    
    func startFaceDetection() {
        let configuration = ARFaceTrackingConfiguration()
        configuration.maximumNumberOfTrackedFaces = 3
        
        arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func takeSnapShot() {
        print("Snapshot taken")
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.arView.snapshot(saveToHDR: false) { (image) in
                let compressedImage = UIImage(data: (image?.pngData())!)
                
                UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
            }
        }
    }
    
    func saveSnapShot(snapShot: UIImage) {
        UIImageWriteToSavedPhotosAlbum(snapShot, nil, nil, nil)
    }
    
    
    func cropImage(position: CGPoint, width: CGFloat, height: CGFloat, inputImage: UIImage)-> UIImage? {
        let cropZone = CGRect(x: position.x, y: position.y, width: width, height: height)
        
        guard let cutImageRef: CGImage = inputImage.cgImage?.cropping(to: cropZone) else { return nil}
        return UIImage(cgImage: cutImageRef)
//        return UIImage(cgImage: cutImageRef, scale: inputImage.imageRendererFormat.scale, orientation: inputImage.imageOrientation)
    }
    
    func reRun() {
        let config = ARWorldTrackingConfiguration()
        arView.session.run(config)
    }

    
}

extension YoungIlDaeFaceTrackingViewController: ARSessionDelegate {
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        arView.scene.anchors.removeAll()
        guard let faceAnchor = anchors.first as? ARFaceAnchor else { return }
        
            
        for i in (0..<anchors.count) {
            let faceAnchor = anchors[i] as? ARFaceAnchor
            let anchor = AnchorEntity(anchor: faceAnchor!)
            anchor.addChild(models[i] as! Entity)
            arView.scene.anchors.append(anchor)
        }
        
//        print(anchors.count)
//        print((anchors as? [ARFaceAnchor])!)
//        print(faceAnchor)
//        let anchor1 = AnchorEntity(anchor: faceAnchor)
//        let anchor2 = AnchorEntity(anchor: faceAnchor)
//        print(anchors.count)
//        print(anchors)
//        anchor1.addChild(model01)
//        anchor2.addChild(model02)
//        arView.scene.anchors.append(anchor1)
//        arView.scene.anchors.append(anchor2)
        
    }
    
    
}
