//
//  GAModel.swift
//  GABootcamp
//
//  Created by Jeremy Huff on 9/17/15.
//  Copyright © 2015 Jeremy Huff. All rights reserved.
//

import Foundation
import CoreLocation

class GAModel: NSObject, CLLocationManagerDelegate {
    
    var location: CLLocation? = nil
    let locationManager = CLLocationManager()
    
    func makeRequest() {
        
        if let locationUnwrapped = location {
            
            let lat = locationUnwrapped.coordinate.latitude
            let long = locationUnwrapped.coordinate.longitude
            
            let manager = AFHTTPRequestOperationManager()
            
            manager.GET("https://api.foursquare.com/v2/venues/search?ll=\(lat),\(long)&client_id=CW5YNXD2MWJCBMS2MROMPUFYQA4IKC0N3SX2QM35MRTNEF2W&client_secret=HMJ13ARXHZUXGHVBJQCVCYEIT0B3QTGV5LNLA1AIDC0OYL0A&v=20150916",
                parameters: nil,
                success: { (operation: AFHTTPRequestOperation, response: AnyObject) -> Void in
                    print("Success")
                    
                    // Print the returned names
                    let venues = self.getVenuesArrayFromResponse(response)
                    for venue in venues {
                        let venueDict = venue as! [NSObject:AnyObject]
                        let name = venueDict["name"] as! String
                        print(name)
                    }
                }) { (operation: AFHTTPRequestOperation, error: NSError) -> Void in
                    print("Failure")
            }
        }
    }
    
    private func getVenuesArrayFromResponse(response: AnyObject) -> [AnyObject] {
        let responseDictionary = response as! [NSObject:AnyObject]
        
        let level1 = responseDictionary["response"] as! [NSObject:AnyObject]
        return level1["venues"] as! [AnyObject]
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.last
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        self.location = newLocation
    }
}