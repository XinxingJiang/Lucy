//
//  LocationPermissionUtil.swift
//  YesterdayOnceMore
//
//  Created by Xinxing Jiang on 10/11/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class LocationPermissionUtil {
    class func checkLocationPermission() -> Bool {
        let status = CLLocationManager.authorizationStatus()
        return (status == .AuthorizedAlways || status == .AuthorizedWhenInUse)
    }
}
