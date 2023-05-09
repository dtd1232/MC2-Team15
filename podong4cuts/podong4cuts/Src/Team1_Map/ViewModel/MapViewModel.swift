//
//  MapViewModel.swift
//  podong4cuts
//
//  Created by BAE on 2023/05/08.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapViewModel: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var annotations: [CustomAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
//        coordinator 사용시 아래 delegate 주석 해제
//        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)
//        showAnnotations 메서드: 지도에 설정한 핀을 한눈에 볼 수 있는 위치로 카메라 이동
//        uiView.showAnnotations(annotations, animated: false)
    }
    
//    coordinator 사용시 아래 makeCoordinator, Coordinator 주석해제
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator()
//    }
//
//    class Coordinator: NSObject, MKMapViewDelegate {
//        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//            guard let customAnnotation = annotation as? CustomAnnotation else {
//                return nil
//            }
//
//            let identifier = "CustomAnnotation"
//            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
//
//            if annotationView == nil {
//                annotationView = MKMarkerAnnotationView(annotation: customAnnotation, reuseIdentifier: identifier)
//            } else {
//                annotationView?.annotation = customAnnotation
//            }
//
//            return annotationView
//        }
//    }
}
