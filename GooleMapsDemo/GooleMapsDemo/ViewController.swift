//
//  ViewController.swift
//  GooleMapsDemo
//
//  Created by Sandeep Parmar on 25/12/19.
//  Copyright © 2019 Sandeep Parmar. All rights reserved.
//

import UIKit
import GooglePlacePicker

class ViewController: UIViewController {
    
    private var placeClient = GMSPlacePickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func showPicker(_ sender: UIButton){
        
        let center = CLLocationCoordinate2D(latitude: 18.6532, longitude: 73.9088)
        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001,
                                               longitude: center.longitude + 0.001)
        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001,
                                               longitude: center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        
        placeClient = GMSPlacePickerViewController(config: config)
        
        placeClient.navigationController?.navigationBar.backgroundColor = UIColor.red
        placeClient.navigationController?.navigationBar.isTranslucent = false
        placeClient.navigationController?.navigationBar.barTintColor = UIColor.white
        placeClient.delegate = self
        
        self.view.addSubview(self.placeClient.view)
//        self.present(placeClient, animated: true) {
//
//        }
    }
    
}
extension ViewController : GMSPlacePickerViewControllerDelegate {
    
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
extension ViewController : GMSAutocompleteViewControllerDelegate {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {

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
        
        
//        self.viewContainer.isHidden = false
//        self.indicatorView.isHidden = true
//        self.lblName.text = place.name
//        self.lblAddress.text = place.formattedAddress?.components(separatedBy: ", ")
//            .joined(separator: "\n")
//        self.lblLatitude.text = String(place.coordinate.latitude)
//        self.lblLongitude.text = String(place.coordinate.longitude)
//        print("PlaceID : ",place.placeID)
//
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
//        self.viewContainer.isHidden = true
        
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        self.dismiss(animated: true, completion: nil)
//        self.viewContainer.isHidden = true
//        self.indicatorView.isHidden = true
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
