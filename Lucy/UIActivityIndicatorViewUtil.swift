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
        let centerXCon = NSLayoutConstraint(item: spinner, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0)
        let centerYCon = NSLayoutConstraint(item: spinner, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
        view.addConstraints([centerXCon, centerYCon])
        
        return spinner
    }
}