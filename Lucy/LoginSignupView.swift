//
//  LoginSignupView.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/18/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class LoginSignupView: UIView {

    // MARK: - Fields
    
    weak var parentView: UIView!
    var label: UILabel!
    var loginButton: UIButton!
    var signupButton: UIButton!
    
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
        initLabel()
        initLoginButton()
        initSignupButton()
    }
    
    private func initLabel() {
        label = UILabel()
        label.text = Constants.LabelText
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        label.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor, constant: Constants.LabelCenterYConstants).active = true
    }
    
    private func initLoginButton() {
        loginButton = UIButton(type: .Custom)
        loginButton.setTitle(Constants.LoginButtonTitle, forState: .Normal)
        loginButton.setTitleColor(Constants.LoginButtonTitleColor, forState: .Normal)
        loginButton.backgroundColor = Constants.LoginButtonBackgroundColor
        loginButton.layer.cornerRadius = Constants.LoginButtonCornerRadius
        self.addSubview(loginButton)
        
        loginButton.addTarget(nil, action: Selector(Constants.LoginButtonSelector), forControlEvents: .TouchUpInside)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.heightAnchor.constraintEqualToConstant(Constants.LoginButtonHeight).active = true
        loginButton.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: Constants.LoginButtonLeadingConstant).active = true
        loginButton.trailingAnchor.constraintEqualToAnchor(self.centerXAnchor, constant: Constants.LoginButtonTrailingConstant).active = true
        loginButton.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: Constants.LoginButtonBottomConstant).active = true
    }
    
    private func initSignupButton() {
        signupButton = UIButton(type: .Custom)
        signupButton.setTitle(Constants.SignupButtonTitle, forState: .Normal)
        signupButton.setTitleColor(Constants.SignupButtonTitleColor, forState: .Normal)
        signupButton.backgroundColor = Constants.SignupButtonBackgroundColor
        signupButton.layer.cornerRadius = Constants.SignupButtonCornerRadius
        self.addSubview(signupButton)
        
        signupButton.addTarget(nil, action: Selector(Constants.SignupButtonSelector), forControlEvents: .TouchUpInside)
        
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        
        signupButton.heightAnchor.constraintEqualToAnchor(loginButton.heightAnchor).active = true
        signupButton.leadingAnchor.constraintEqualToAnchor(self.centerXAnchor, constant: Constants.SignupButtonLeadingConstant).active = true
        signupButton.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: Constants.SignupButtonTrailingConstant).active = true
        signupButton.bottomAnchor.constraintEqualToAnchor(loginButton.bottomAnchor).active = true
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let BackgroundColor = UIColor.whiteColor()
        
        static let LabelText = "The easiest way to shopping"
        static let LabelCenterYConstants = CGFloat(-20)
        
        static let LoginButtonTitle = "Log In"
        static let LoginButtonTitleColor = UIColor.whiteColor()
        static let LoginButtonBackgroundColor = UIColor.blueColor()
        static let LoginButtonCornerRadius = LoginButtonHeight / 2
        static let LoginButtonSelector = "login"
        static let LoginButtonHeight = CGFloat(40)
        static let LoginButtonLeadingConstant = CGFloat(40)
        static let LoginButtonTrailingConstant = CGFloat(-2)
        static let LoginButtonBottomConstant = CGFloat(-40)
        
        static let SignupButtonTitle = "Sign Up"
        static let SignupButtonTitleColor = UIColor.whiteColor()
        static let SignupButtonBackgroundColor = LoginButtonBackgroundColor
        static let SignupButtonCornerRadius = LoginButtonCornerRadius
        static let SignupButtonSelector = "signup"
        static let SignupButtonLeadingConstant = -LoginButtonTrailingConstant
        static let SignupButtonTrailingConstant = -LoginButtonLeadingConstant
    }
}
