//
//  GAModel.swift
//  GABootcamp
//
//  Created by Jeremy Huff on 9/17/15.
//  Copyright © 2015 Jeremy Huff. All rights reserved.
//

import Foundation

class GAModel {
    
    func makeRequest() {
        
        let manager = AFHTTPRequestOperationManager()
        
        manager.GET("https://api.foursquare.com/v2/venues/search?ll=40.7,-74&client_id=CW5YNXD2MWJCBMS2MROMPUFYQA4IKC0N3SX2QM35MRTNEF2W&client_secret=HMJ13ARXHZUXGHVBJQCVCYEIT0B3QTGV5LNLA1AIDC0OYL0A&v=20150916",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation, response: AnyObject) -> Void in
                print("Success")
            }) { (operation: AFHTTPRequestOperation, error: NSError) -> Void in
                print("Failure")
        }
    }
}