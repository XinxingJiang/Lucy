//
//  ShippingView.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/21/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class ShippingView: UIView {

    // MARK: - Fields
    
    weak var parentView: UIView!
    var tableView: UITableView!
    
    convenience init(parentView: UIView) {
        self.init()
        self.parentView = parentView
        parentView.backgroundColor = Constants.BackgroundColor
        parentView.addSubview(self)
        
        setSameSizeWithView(parentView)
        
        initSubviews()
    }
    
    // MARK: - Private methods
    
    private func initSubviews() {
        initTableView()
    }
    
    private func initTableView() {
        tableView = UITableView()
        self.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraintEqualToAnchor(self.layoutMarginsGuide.topAnchor).active = true
        tableView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        tableView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        tableView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let BackgroundColor = UIColor.whiteColor()                
    }
}
