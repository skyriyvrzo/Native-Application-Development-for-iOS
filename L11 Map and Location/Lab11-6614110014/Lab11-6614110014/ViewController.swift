//
//  ViewController.swift
//  Lab11-6614110014
//
//  Created by MII-MAC-21 on 27/2/2568 BE.
//

import UIKit
import CoreLocation
import Contacts
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var url: UITextField!
    @IBOutlet weak var lat: UITextField!
    @IBOutlet weak var lon: UITextField!
    @IBOutlet weak var fullAddress: UITextView!
    
    var coords: CLLocationCoordinate2D?
    var location: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDeafaultValue()
    }
    
    func setDeafaultValue() {
        city.text = "Nong Chok"
        state.text = "Bangkok"
        zipcode.text = "10530"
        
        lat.text = "13.842457518097293"
        lon.text = "100.85572157172678"
    }
    
    func myHomeLoc() {
        city.text = "Phaisali"
        state.text = "Nakhon Sawan"
        zipcode.text = "60220"
        
        lat.text = "15.6027732"
        lon.text = "100.6430368"
    }
    
    @IBAction func getDirections(_ sender: AnyObject) {
        let addressString = "\(streetAddress.text!) \(city.text!) \(state.text!) \(zipcode.text!)"
        CLGeocoder().geocodeAddressString(addressString, completionHandler: {(placemarks, error) in
            if error != nil {
                print("Geocode failed with error: \(error!.localizedDescription)")
            } else if placemarks!.count > 0 {
                let placemark = placemarks![0]
                let location = placemark.location
                self.coords = location!.coordinate
                self.showMap()
            }
        })
    }
    
    func showMap() {
        let addressDict =
        [CNPostalAddressStreetKey: streetAddress.text!,
           CNPostalAddressCityKey: city.text!,
          CNPostalAddressStateKey: state.text!,
     CNPostalAddressPostalCodeKey: zipcode.text!]
        let place = MKPlacemark(coordinate: coords!, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: place)
        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMaps(launchOptions: options)
    }
    
    @IBAction func getForward(_ sender: Any) {
        if let streetString = streetAddress.text,
           let cityString = city.text,
           let stateString = state.text,
           let zipString = zipcode.text {
            let addressString = "\(streetString) \(cityString) \(stateString) \(zipString)"
            
            CLGeocoder().geocodeAddressString(addressString, completionHandler: {
                [self](placemarks, error) in
                if error != nil {
                    print("Geocode failed with error: \(error!.localizedDescription)")
                } else if placemarks!.count > 0 {
                    let placemark = placemarks![0]
                    self.location = placemark.location
                    self.coords = self.location!.coordinate
                    self.lat.text = "\(coords!.latitude)"
                    self.lon.text = "\(coords!.longitude)"
                }
            })
        }
    }
    
    @IBAction func getReverse(_ sender: Any) {
        if let latValue = Double(lat.text!),
           let lonValue = Double(lon.text!) {
            let location = CLLocation(latitude: latValue, longitude: lonValue)
            
            CLGeocoder().reverseGeocodeLocation(location, preferredLocale: nil) {
                (clPlacemark: [CLPlacemark]?, error: Error?) in
                guard let place = clPlacemark?.first else {
                    print("No placemark from Apple: \(String(describing: error))")
                    return
                }
                
                var addressString = ""
                
                if let address = place.subThoroughfare {
                    addressString += address
                    addressString += ", "
                }
                
                if let address = place.subLocality {
                    addressString += address
                    addressString += ", "
                }
                
                if let address = place.subAdministrativeArea {
                    addressString += address
                    addressString += ", "
                }
                
                if let address = place.locality {
                    addressString += address
                    addressString += ", "
                }
                
                if let address = place.country {
                    addressString += address
                    addressString += ", "
                }
                
                if let address = place.postalCode {
                    addressString += address
                }
                
                print(addressString)
                self.fullAddress.text = addressString
            }
        }
    }
    @IBAction func getPlace(_ sender: Any) {
//        if let streetString = streetAddress.text,
//           let cityString = city.text,
//           let stateString = state.text,
//           let zipString = zipcode.text,
//           let coords = self.coords {
//            let addressDict =
//            [CNPostalAddressStreetKey: streetString,
//               CNPostalAddressCityKey: cityString,
//              CNPostalAddressStateKey: stateString,
//         CNPostalAddressPostalCodeKey: zipString]
//            
//            let place = MKPlacemark(coordinate: coords, addressDictionary: addressDict)
//            let mapItem = MKMapItem(placemark: place)
//            mapItem.name = name!.text == "" ? place.name : name!.text
//            mapItem.phoneNumber = phone!.text == "" ? "098-765-4321" : phone!.text
//            let urlString = url!.text == "" ? "https://www.google.com/" : url!.text
//            mapItem.url = URL(string: urlString!)
//            mapItem.openInMaps(launchOptions: nil)
//        }
        
        getPlaceV2(sender)
    }
    
    func getPlaceV2(_ sender: Any) {
        if let streetString = streetAddress.text,
           let cityString = city.text,
           let stateString = state.text,
           let zipString = zipcode.text {
            let addressString = "\(streetString) \(cityString) \(stateString) \(zipString)"
            
            CLGeocoder().geocodeAddressString(addressString, completionHandler: {
                [self](placemarks, error) in
                if error != nil {
                    print("Geocode failed with error: \(error!.localizedDescription)")
                } else if placemarks!.count > 0 {
                    let placemark = placemarks![0]
                    self.location = placemark.location
                    self.coords = self.location!.coordinate
                    
                    let addressDict = [CNPostalAddressStreetKey: streetString,
                       CNPostalAddressCityKey: cityString,
                      CNPostalAddressStateKey: stateString,
                 CNPostalAddressPostalCodeKey: zipString]
                    
                    let place = MKPlacemark(coordinate: self.coords!, addressDictionary: addressDict)
                    let mapItem = MKMapItem(placemark: place)
                    mapItem.name = name!.text == "" ? place.name : name!.text
                    mapItem.phoneNumber = phone!.text
                    mapItem.url = URL(string: url!.text ?? "")
                    mapItem.openInMaps(launchOptions: nil)
                }
            })
        }
    }
    
    
    @IBAction func defaultAddress(_ sender: Any) {
        streetAddress.text = "Pangmuang 2"
        city.text = "Phaisali"
        state.text = "Nakhon Sawan"
        zipcode.text = "60220"
    }
    
    
    @IBAction func defaultLatLon(_ sender: Any) {
        lat.text = "15.6027732"
        lon.text = "100.6430368"
    }
}

