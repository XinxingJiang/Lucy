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
    var tableView: UITableView!
    var sendRequestButton: UIButton!
    
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
        initSendRequestButton()
        initTableView()
    }
    
    private func initSendRequestButton() {
        sendRequestButton = UIButton()
        self.addSubview(sendRequestButton)
        sendRequestButton.setTitle(Constants.SendRequestButtonTitle, forState: .Normal)
        sendRequestButton.setTitleColor(Constants.SendRequestButtonTitleColor, forState: .Normal)
        sendRequestButton.backgroundColor = Constants.SendRequestButtonBackgroundColor
        sendRequestButton.layer.cornerRadius = Constants.SendRequestButtonHeightConstant / 2
        sendRequestButton.addTarget(nil, action: Selector(Constants.SendRequestButtonSelector), forControlEvents: .TouchUpInside)
        sendRequestButton.translatesAutoresizingMaskIntoConstraints = false
        sendRequestButton.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        sendRequestButton.heightAnchor.constraintEqualToConstant(Constants.SendRequestButtonHeightConstant).active = true
        sendRequestButton.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: Constants.SendRequestButtonBottomConstant).active = true
    }
    
    private func initTableView() {
        tableView = UITableView()
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        tableView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true
        tableView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        tableView.bottomAnchor.constraintEqualToAnchor(sendRequestButton.topAnchor, constant: Constants.TableViewBottomConstant).active = true
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let BackgroundColor = UIColor.whiteColor()
        
        static let SendRequestButtonTitle = "    Send a Request    " // space is made deliberately
        static let SendRequestButtonTitleColor = UIColor.whiteColor()
        static let SendRequestButtonBackgroundColor = UIColor.blueColor()
        static let SendRequestButtonSelector = "sendRequest"
        static let SendRequestButtonHeightConstant = CGFloat(40)
        static let SendRequestButtonBottomConstant = CGFloat(-40)
        
        static let TableViewBottomConstant = CGFloat(-20)
    }
}
