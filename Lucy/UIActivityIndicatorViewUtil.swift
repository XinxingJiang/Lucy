//
//  UIActivityIndicatorViewUtil.swift
//
//  Created by Xinxing Jiang on 10/2/15.
//  Copyright © 2015 xjiang. All rights reserved.
//

import Foundation
import UIKit

class UIActivityIndicatorViewUtil {
    class func initSpinner(view view: UIView) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        spinner.hidesWhenStopped = true
        view.addSubview(spinner)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        spinner.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        spinner.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        
        return spinner
    }
}