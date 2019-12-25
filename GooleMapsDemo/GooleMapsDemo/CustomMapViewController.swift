//
//  CustomMapViewController.swift
//  GooleMapsDemo
//
//  Created by Sandeep Parmar on 25/12/19.
//  Copyright © 2019 Sandeep Parmar. All rights reserved.
//

import UIKit
import GooglePlacePicker

class CustomMapViewController: GMSPlacePickerViewController, GMSPlacePickerViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let center = CLLocationCoordinate2D(latitude: 18.6532, longitude: 73.9088)
               let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001,
                                                      longitude: center.longitude + 0.001)
               let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001,
                                                      longitude: center.longitude - 0.001)
               let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
               let config = GMSPlacePickerConfig(viewport: viewport)
        
        
        self.delegate = self
    }
    func placePicker(_ viewController: GMSPlacePickerViewController, didFailWithError error: Error)
    {
        
    }
    
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace)
    {
        
        print("name :",place.name)
        print("placeID :",place.placeID)
        print("coordinate :",place.coordinate)
        print("formattedAddress :",place.formattedAddress as Any)
        print("addressComponents :",place.addressComponents as Any)
        print("types :",place.types)
        print("phoneNumber :",place.phoneNumber as Any)
        print("rating :",place.rating)
        print("attributions :",place.attributions as Any)
        print("viewport :",place.viewport as Any)
        
        viewController.dismiss(animated: true, completion: nil)
        
    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController)
    {
        // Dismiss the place picker, as it cannot dismiss itself.
        viewController.dismiss(animated: true, completion: nil)
        print("No place selected")
    }


}
