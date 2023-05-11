//
//  ImageManager.swift
//  CameraFrameView
//
//  Created by user on 2023/05/11.
//

import Photos
import UIKit

class ImageManager {
    static let shared = ImageManager()
    
    private let imageManager = PHImageManager()
    var requestImageOption = PHImageRequestOptions()
    
    init() {
        setRequestImageOptions()
    }
    
    func requestImage(from asset: PHAsset, thumbnailSize: CGSize, completion: @escaping (UIImage?) -> Void) {
        
        self.imageManager.requestImage(for: asset, targetSize: CGSize(width: 120, height: 120), contentMode: .aspectFill, options: requestImageOption) { image, info in
            completion(image)
        }
    }
    
    func requestDetailImage(from asset: PHAsset, thumbnailSize: CGSize, completion: @escaping (UIImage?) -> Void) {
        
//        self.imageManager.requestImage(for: asset,targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: requestImageOption) { image, info in
//            completion(image)
//        }
        self.imageManager.requestImage(for: asset, targetSize: CGSize(width: 360, height: 480), contentMode: .aspectFill, options: requestImageOption) { image, info in
            completion(image)
        }
    }
    
    func setRequestImageOptions() {
        requestImageOption.isSynchronous = true
        requestImageOption.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat
        requestImageOption.resizeMode = PHImageRequestOptionsResizeMode.exact
//        requestImageOption.normalizedCropRect = CGRect(x: 0.25, y: 0.25, width: thumbnailSize.width, height: thumbnailSize.height)
    }
}
