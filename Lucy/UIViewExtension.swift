//
//  UIViewExtension.swift
//
//  Created by Xinxing Jiang on 10/15/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var shown: Bool { // opposite of hidden
        get {
            return !self.hidden
        } set {
            self.hidden = !newValue
        }
    }
    
    // self should be descendant of anotherView
    func setSameSizeWithView(anotherView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraintEqualToAnchor(anotherView.widthAnchor).active = true
        self.heightAnchor.constraintEqualToAnchor(anotherView.heightAnchor).active = true
    }
}