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
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .frame(width: 400, height: 600)
            
            HStack{
                Spacer(minLength: 40)
                VStack(spacing: 10) {
                    
                    
                    HStack(spacing: 10) {
                        Button(action: {
                            self.selectedTag = 1
                            self.showImagePicker = true
                        }) {
                            if let image = image1 {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 150, height: 200)
                                    .scaledToFill()
                            } else {
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: 150, height: 200)
                            }
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                        Button(action: {
                            self.selectedTag = 2
                            self.showImagePicker = true
                        }) {
                            if let image = image2 {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 150, height: 200)
                                    .scaledToFill()
                            } else {
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: 150, height: 200)
                            }
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    
                    HStack(spacing: 10) {
                        Button(action: {
                            self.selectedTag = 3
                            self.showImagePicker = true
                        }) {
                            if let image = image3 {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 150, height: 200)
                                    .scaledToFill()
                            } else {
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: 150, height: 200)
                            }
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                        Button(action: {
                            self.selectedTag = 4
                            self.showImagePicker = true
                        }) {
                            if let image = image4 {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 150, height: 200)
                                    .scaledToFill()
                            } else {
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: 150, height: 200)
                            }
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .padding(.bottom, 40)
                    
                    Button("공유") {
                        
                        if let image = createCompositeImage() {
                            
                            let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
                            UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true)
                            
                        }
                    }
                    .disabled(image1 == nil || image2 == nil || image3 == nil || image4 == nil)
                }
                
                Spacer(minLength: 40)
            }
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
    
    private func createCompositeImage() -> UIImage? {
        guard let image1 = image1, let image2 = image2, let image3 = image3, let image4 = image4 else {
            return nil
        }
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 600, height: 600))
        let image = renderer.image { ctx in
            let rect1 = CGRect(x: 0, y: 0, width: 300, height: 300)
            let rect2 = CGRect(x: 300, y: 0, width: 300, height: 150)
            let rect3 = CGRect(x: 300, y: 150, width: 300, height: 150)
            let rect4 = CGRect(x: 0, y: 300, width: 300, height: 300)
            
            image1.draw(in: rect1)
            image2.draw(in: rect2)
            image3.draw(in: rect3)
            image4.draw(in: rect4)
        }
        
        return image
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
