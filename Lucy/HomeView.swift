//
//  HomeView.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/20/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class HomeView: UIView {

    // MARK: - Fields
    
    weak var parentView: UIView!
    
    convenience init(parentView: UIView) {
        self.init()
        self.parentView = parentView
        parentView.backgroundColor = Constants.BackgroundColor
        initSubviews()
    }
    
    // MARK: - Private methods
    
    private func initSubviews() {
        
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let BackgroundColor = UIColor.whiteColor()
    }
}
