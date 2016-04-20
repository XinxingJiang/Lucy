//
//  SettingsView.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/20/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    // MARK: - Fields
    
    weak var parentView: UIView!
    var photoButton: UIButton!
    var nicknameLabel: UILabel!
    var settingsTableView: UITableView!
    
    convenience init(parentView: UIView) {
        self.init()
        self.parentView = parentView
        parentView.backgroundColor = UIColor.whiteColor()
        parentView.addSubview(self)
        
        setSameSizeWithView(parentView)
        
        initSubviews()
    }
    
    // MARK: - Private methods
    
    private func initSubviews() {
        initPhotoButton()
        initNicknameLabel()
        initSettingsTableView()
    }
    
    private func initPhotoButton() {
        photoButton = UIButton(type: .System)
        self.addSubview(photoButton)
        
        photoButton.setTitle(Constants.PhotoButtonTitle, forState: .Normal)
        photoButton.setTitleColor(Constants.PhotoButtonTitleColor, forState: .Normal)
        photoButton.contentHorizontalAlignment = .Center
        photoButton.titleLabel?.numberOfLines = 0
        
        photoButton.layer.cornerRadius = 5.0
        photoButton.layer.borderColor = UIColor.grayColor().CGColor
        photoButton.layer.borderWidth = 1.0
        
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        
        photoButton.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        photoButton.topAnchor.constraintEqualToAnchor(self.layoutMarginsGuide.topAnchor, constant: Constants.PhotoButtonTopConstant).active = true
        photoButton.heightAnchor.constraintEqualToConstant(Constants.PhotoButtonHeight).active = true
        photoButton.widthAnchor.constraintEqualToAnchor(photoButton.heightAnchor).active = true
        
        photoButton.addTarget(nil, action: Selector(Constants.PhotoButtonSelector), forControlEvents: .TouchUpInside)
    }
    
    private func initNicknameLabel() {
        nicknameLabel = UILabel()
        self.addSubview(nicknameLabel)
        
        nicknameLabel.text = Constants.NicknameLabelTitle
        
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nicknameLabel.topAnchor.constraintEqualToAnchor(photoButton.bottomAnchor, constant: Constants.NicknameLabelTopConstant).active = true
        nicknameLabel.centerXAnchor.constraintEqualToAnchor(photoButton.centerXAnchor).active = true
    }
    
    private func initSettingsTableView() {
        settingsTableView = UITableView()
        self.addSubview(settingsTableView)
        
        settingsTableView.scrollEnabled = false
        
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        settingsTableView.topAnchor.constraintEqualToAnchor(nicknameLabel.bottomAnchor, constant: Constants.SettingsTableViewTopConstant).active = true
        settingsTableView.heightAnchor.constraintEqualToConstant(Constants.SettingsTableViewCellHeight * CGFloat(Constants.SettingsTableViewCellNumber)).active = true
        settingsTableView.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let PhotoButtonTitle = "Add Photo"
        static let PhotoButtonTitleColor = UIColor.grayColor()
        static let PhotoButtonTopConstant = CGFloat(20) + ConstraintConstants.DefaultNavigationBarHeight
        static let PhotoButtonHeight = CGFloat(60)
        static let PhotoButtonWidth = PhotoButtonHeight
        static let PhotoButtonSelector = "clickPhotoButton"
        
        static let NicknameLabelTitle = "nickname"
        static let NicknameLabelTopConstant = CGFloat(20)
        
        static let SettingsTableViewTopConstant = CGFloat(20)
        static let SettingsTableViewCellHeight = CGFloat(40)
        static let SettingsTableViewCellNumber = 6
    }
}
