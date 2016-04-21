//
//  AddDeliveryAddressView.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/21/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class AddDeliveryAddressView: UIView {
    
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
        tableView.scrollEnabled = false
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 0).active = true
        tableView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        tableView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true
        tableView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let BackgroundColor = UIColor.whiteColor()
        
        static let FullNameViewHeightConstant = CGFloat(80)
    }
}
