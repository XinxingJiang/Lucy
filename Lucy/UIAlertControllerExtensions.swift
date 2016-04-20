//
//  UIAlertControllerExtensions.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/21/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import Foundation

extension UIAlertController {
    func addCancelAction() {
        self.addAction(UIAlertAction(title: Constants.CancelActionTitle, style: .Cancel, handler: nil))
    }
    
    private struct Constants {
        static let CancelActionTitle = "Cancel"
    }
}