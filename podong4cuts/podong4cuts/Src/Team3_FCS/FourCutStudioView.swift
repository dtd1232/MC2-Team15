//
//  FourCutStudioView.swift
//  podong4cuts
//
//  Created by Eric Lee on 2023/05/03.
//

import SwiftUI
import PhotosUI

struct FourCutStudioView: View {
    @State private var image1: UIImage?
    @State private var image2: UIImage?
    @State private var image3: UIImage?
    @State private var image4: UIImage?
    
    @State private var showImagePicker = false
    @State private var selectedTag = 0
    
    @State private var image1Tapped = false
    @State private var image2Tapped = false
    @State private var image3Tapped = false
    @State private var image4Tapped = false
    
    let spacing: CGFloat = 20
    
    var body: some View {
        
        VStack{
            
            Rectangle()
                .frame(width: 0, height: 50)
            
            //MARK: - 네컷 프레임
            
            GeometryReader { geo in
                
                let photoWidth: CGFloat = (geo.size.width - 3*spacing)/2
                let photoheigth: CGFloat = (geo.size.height - 3*spacing)/2
                
                ZStack{
                    
                    Image("podong4cutFrame")
                        .resizable()
                        .scaledToFill()
                    
                    HStack{
                        Spacer()
                        //왼쪽
                        VStack{
                            
                            Spacer()
                            
                            //MARK: - 1번 사진 영역
                            ZStack{
                                
                                if let image = image1{
                                    
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: photoWidth, height: photoheigth)
                                        .clipped()
                                        .onTapGesture {
                                            toggleImageTapped(num: 1)
                                        }
                                    
                                    if image1Tapped{
                                        Rectangle()
                                            .fill(Color(hex: "000000", opacity: 0.5))
                                            .onTapGesture {
                                                self.image1Tapped = false
                                            }
                                        Image(systemName: "trash.circle.fill")
                                            .foregroundColor(.white)
                                            .onTapGesture {
                                                self.image1Tapped = false
                                                self.image1 = nil
                                            }
                                        
                                    }
                                
                                }else{
                                    
                                    Rectangle()
                                        .fill(.gray)
                                        .onTapGesture {
                                            
                                            self.selectedTag = 1
                                            self.showImagePicker = true
                                            
                                        }
                                    
                                }
                            }
                            .frame(width: photoWidth, height: photoheigth)
                            
                            Spacer()
                            
                            //MARK: - 2번 사진 영역
                            ZStack{
                                
                                if let image = image2{
                                    
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: photoWidth, height: photoheigth)
                                        .clipped()
                                        .onTapGesture {
                                            toggleImageTapped(num: 2)
                                        }
                                    
                                    if image2Tapped{
                                        Rectangle()
                                            .fill(Color(hex: "000000", opacity: 0.5))
                                            .onTapGesture {
                                                self.image2Tapped = false
                                            }
                                        Image(systemName: "trash.circle.fill")
                                            .foregroundColor(.white)
                                            .onTapGesture {
                                                self.image2Tapped = false
                                                self.image2 = nil
                                            }
                                        
                                    }
                                
                                }else{
                                    
                                    Rectangle()
                                        .fill(.gray)
                                        .onTapGesture {
                                            
                                            self.selectedTag = 2
                                            self.showImagePicker = true
                                            
                                        }
                                    
                                }
                            }
                            .frame(width: photoWidth, height: photoheigth)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        VStack{
                            Spacer()
                            
                            //MARK: - 3번 사진
                            ZStack{
                                
                                if let image = image3{
                                    
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: photoWidth, height: photoheigth)
                                        .clipped()
                                        .onTapGesture {
                                            toggleImageTapped(num: 3)
                                        }
                                    
                                    if image3Tapped{
                                        Rectangle()
                                            .fill(Color(hex: "000000", opacity: 0.5))
                                            .onTapGesture {
                                                self.image3Tapped = false
                                            }
                                        Image(systemName: "trash.circle.fill")
                                            .foregroundColor(.white)
                                            .onTapGesture {
                                                self.image3Tapped = false
                                                self.image3 = nil
                                            }
                                        
                                    }
                                
                                }else{
                                    
                                    Rectangle()
                                        .fill(.gray)
                                        .onTapGesture {
                                            
                                            self.selectedTag = 3
                                            self.showImagePicker = true
                                            
                                        }
                                    
                                }
                            }
                            .frame(width: photoWidth, height: photoheigth)
                            
                            Spacer()
                            
                            //MARK: - 4번 사진
                            ZStack{
                                
                                if let image = image4{
                                    
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: photoWidth, height: photoheigth)
                                        .clipped()
                                        .onTapGesture {
                                            toggleImageTapped(num: 4)
                                        }
                                    
                                    if image4Tapped{
                                        Rectangle()
                                            .fill(Color(hex: "000000", opacity: 0.5))
                                            .onTapGesture {
                                                self.image4Tapped = false
                                            }
                                        Image(systemName: "trash.circle.fill")
                                            .foregroundColor(.white)
                                            .onTapGesture {
                                                self.image4Tapped = false
                                                self.image4 = nil
                                            }
                                        
                                    }
                                
                                }else{
                                    
                                    Rectangle()
                                        .fill(.gray)
                                        .onTapGesture {
                                            
                                            self.selectedTag = 4
                                            self.showImagePicker = true
                                            
                                        }
                                    
                                }
                            }
                            .frame(width: photoWidth, height: photoheigth)
                            
                            Spacer()
                        }
                        Spacer()
                        
                    }
                    
                    
                }
            }
            .frame(width: 300, height: 400)
            
            Spacer()
            
            //MARK: - 출력 버튼
            ZStack{
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(.black)
                    .frame(width: 256, height: 55)
                
                HStack{
                    
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.white)
                    
                    Text("공유하기")
                        .foregroundColor(.white)
                    
                }
                
            }
            .padding()
            .onTapGesture {
                
                if let image = createFourCutImage() {
                    
                    let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
                    UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true)
                    
                }

            }
            
            Spacer()
            
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary) { image in
                switch self.selectedTag {
                case 1:
                    self.image1 = image
                case 2:
                    self.image2 = image
                case 3:
                    self.image3 = image
                case 4:
                    self.image4 = image
                default:
                    break
                }
                
                self.showImagePicker = false
            }
        } 
    }
    
    private func createFourCutImage() -> UIImage? {
        guard let image1 = image1, let image2 = image2, let image3 = image3, let image4 = image4 else {
            return nil
        }
        
        let aspectRatio: CGFloat = 3.0 / 4.0
        let size = CGSize(width: 627, height: 836)
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1490, height: 2219))
        let image = renderer.image { ctx in
            let bgFrame = CGRect(x: 0, y: 0, width: 1490, height: 2219)
            UIImage(named: "podong4cutFrame")?.draw(in: bgFrame)
            
            let rect1 = CGRect(x: 103, y: 375, width: 627, height: 836)
            let rect2 = CGRect(x: 103, y: 1241, width: 627, height: 836)
            let rect3 = CGRect(x: 760, y: 375, width: 627, height: 836)
            let rect4 = CGRect(x: 760, y: 1241, width: 627, height: 836)
            
            
            let croppedImage1 = createCroppedImage(originalImage: image1, cropSize: size)
            let croppedImage2 = createCroppedImage(originalImage: image2, cropSize: size)
            let croppedImage3 = createCroppedImage(originalImage: image3, cropSize: size)
            let croppedImage4 = createCroppedImage(originalImage: image4, cropSize: size)
            
            
            croppedImage1?.draw(in: rect1)
            croppedImage2?.draw(in: rect2)
            croppedImage3?.draw(in: rect3)
            croppedImage4?.draw(in: rect4)
            
        }
        
        return image
    }
    
    private func createCroppedImage(originalImage: UIImage, cropSize: CGSize) -> UIImage?{
        
        
        let renderer = UIGraphicsImageRenderer(size: cropSize)
        
        let image = renderer.image { ctx in
            
            let cropRect = createCropRect(imageSize: originalImage.size)
            
            //CGImage 변환 목적: UIImage에는 없는 Cropping 메소드 사용하기 위함
            guard let originalCGImageCropped = originalImage.cgImage?.cropping(to: cropRect) else{
                return
            }
            
            let croppedImage = UIImage(cgImage: originalCGImageCropped)
            
            croppedImage.draw(in: CGRect(origin: .zero, size: cropSize))
            
        }
        
        return image
        
    }
    
    private func createCropRect(imageSize: CGSize) -> CGRect{
        //image의 크기를 기준으로 AspectFill을 만족하는 CropRec 반환
        
        let aspectRatio: CGFloat = 3.0 / 4.0
        var cropRect: CGRect
        
        if imageSize.width / imageSize.height > aspectRatio {
            //가로가 더 길다?
            //세로를 기준으로 가로 자르기~
            let heigth = imageSize.height
            let width = heigth * aspectRatio
            let x = (imageSize.width - width) / 2
            cropRect = CGRect(x: x, y: 0, width: width, height: heigth)
            
        }else{
            //세로가 더 길다?
            //가로를 기준으로 세로 자르기~
            let width = imageSize.width
            let heigth = width / aspectRatio
            let y = (imageSize.height - heigth) / 2
            cropRect = CGRect(x: 0, y: y, width: width, height: heigth)
            
        }
        
        return cropRect
    }
    
    private func toggleImageTapped(num: Int) {
        switch num {
        case 1:
            image1Tapped.toggle()
            if image1Tapped {
                image2Tapped = false
                image3Tapped = false
                image4Tapped = false
            }
        case 2:
            image2Tapped.toggle()
            if image2Tapped {
                image1Tapped = false
                image3Tapped = false
                image4Tapped = false
            }
        case 3:
            image3Tapped.toggle()
            if image3Tapped {
                image1Tapped = false
                image2Tapped = false
                image4Tapped = false
            }
        case 4:
            image4Tapped.toggle()
            if image4Tapped {
                image1Tapped = false
                image2Tapped = false
                image3Tapped = false
            }
        default:
            break
        }
    }
    
}

struct ImagePicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    typealias SourceType = UIImagePickerController.SourceType
    typealias CompletionHandler = (UIImage) -> Void
    
    let sourceType: SourceType
    let completionHandler: CompletionHandler
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(completionHandler: completionHandler)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let completionHandler: CompletionHandler
        
        init(completionHandler: @escaping CompletionHandler) {
            self.completionHandler = completionHandler
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                completionHandler(image)
            }
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
struct FourCutStudioView_Previews: PreviewProvider {
    static var previews: some View {
        FourCutStudioView()
    }
}
