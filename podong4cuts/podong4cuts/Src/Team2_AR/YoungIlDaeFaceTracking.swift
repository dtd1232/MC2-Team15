//
//  YoungIlDaeFaceTracking.swift
//  podong4cuts
//
//  Created by user on 2023/05/10.
//

import Foundation
import SwiftUI

struct YoungIlDaeFaceTracking: UIViewControllerRepresentable {
    
    let vc = YoungIlDaeFaceTrackingViewController()
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return vc
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func takeSnapShot() {
        vc.takeSnapShot()
    }
    
}

