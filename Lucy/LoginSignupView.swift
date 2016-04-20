//
//  LoginSignupView.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/18/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class LoginSignupView: UIView {

    weak var parentView: UIView!
    var label: UILabel!
    var loginButton: UIButton!
    var signupButton: UIButton!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    convenience init(parentView: UIView) {
        self.init()
        self.parentView = parentView
        parentView.backgroundColor = Constants.BackgroundColor
        initSubviews()
    }
    
    private func initSubviews() {
        parentView.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        let widthCon = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: parentView, attribute: .Width, multiplier: 1, constant: 0)
        let heightCon = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: parentView, attribute: .Height, multiplier: 1, constant: 0)
        parentView.addConstraints([widthCon, heightCon])
        
        initLabel()
        initLoginButton()
        initSignupButton()
    }
    
    private func initLabel() {
        label = UILabel()
        label.text = Constants.LabelText
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: label, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: Constants.LabelCenterYConstants)
        let centerXCon = NSLayoutConstraint(item: label, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        self.addConstraints([centerYCon, centerXCon])
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
        let heightCon = NSLayoutConstraint(item: loginButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: Constants.LoginButtonHeight)
        let leadingCon = NSLayoutConstraint(item: loginButton, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: Constants.LoginButtonLeadingConstant)
        let trailingCon = NSLayoutConstraint(item: loginButton, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: Constants.LoginButtonTrailingConstant)
        let bottomCon = NSLayoutConstraint(item: loginButton, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: Constants.LoginButtonBottomConstant)
        self.addConstraints([heightCon, leadingCon, trailingCon, bottomCon])
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
        let heightCon = NSLayoutConstraint(item: signupButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: Constants.SignupButtonHeight)
        let leadingCon = NSLayoutConstraint(item: signupButton, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: Constants.SignupButtonLeadingConstant)
        let trailingCon = NSLayoutConstraint(item: signupButton, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: Constants.SignupButtonTrailingConstant)
        let bottomCon = NSLayoutConstraint(item: signupButton, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: Constants.SignupButtonBottomConstant)
        self.addConstraints([heightCon, leadingCon, trailingCon, bottomCon])
    }
    
    struct Constants {
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
        static let SignupButtonHeight = LoginButtonHeight
        static let SignupButtonLeadingConstant = -LoginButtonTrailingConstant
        static let SignupButtonTrailingConstant = -LoginButtonLeadingConstant
        static let SignupButtonBottomConstant = LoginButtonBottomConstant
    }
}
