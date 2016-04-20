//
//  UIButtonExtension.swift
//
//  Created by Xinxing Jiang on 10/2/15.
//  Copyright © 2015 xjiang. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func changeClickability(clickable: Bool) {
        self.userInteractionEnabled = clickable
        self.setTitleColor(clickable ? ButtonColorConstants.InteractionEnabledColor : ButtonColorConstants.InteractionDisabledColor, forState: .Normal)
        self.layer.borderColor = clickable ? ButtonColorConstants.InteractionEnabledColor.CGColor : ButtonColorConstants.InteractionDisabledColor.CGColor
    }
}

struct ButtonColorConstants {
    static let InteractionEnabledColor = UIColor.blueColor()
    static let InteractionDisabledColor = UIColor.grayColor()
}