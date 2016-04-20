//
//  InvitationView.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/21/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class InvitationView: UIView {
    
    // MARK: - Fields
    
    weak var parentView: UIView!
    var shareButton: UIButton!
    var copyButton: UIButton!
    var promoCodeTextField: UITextField!
    
    convenience init(parentView: UIView) {
        self.init()
        self.parentView = parentView
        parentView.addSubview(self)
        
        parentView.backgroundColor = Constants.BackgroundColor
        setSameSizeWithView(parentView)
        
        initSubviews()
    }
    
    // MARK: - Private methods
    
    private func initSubviews() {
        initShareButton()
        initCopyButton()
        initPromoCodeTextField()
    }
    
    private func initShareButton() {
        shareButton = UIButton()
        self.addSubview(shareButton)
        
        shareButton.addTarget(nil, action: Selector(Constants.ShareButtonSelector), forControlEvents: .TouchUpInside)
        
        shareButton.setTitle(Constants.ShareButtonTitle, forState: .Normal)
        shareButton.setTitleColor(Constants.ShareButtonTitleColor, forState: .Normal)
        shareButton.layer.borderWidth = 1.0
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        shareButton.heightAnchor.constraintEqualToConstant(Constants.ShareButtonHeightConstant).active = true
        shareButton.widthAnchor.constraintEqualToConstant(Constants.ShareButtonWidthConstant).active = true
        shareButton.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: Constants.ShareButtonTrailingConstant).active = true
        shareButton.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: Constants.ShareButtonBottomConstant).active = true
    }
    
    private func initCopyButton() {
        copyButton = UIButton()
        self.addSubview(copyButton)
        
        copyButton.addTarget(nil, action: Selector(Constants.CopyButtonSelector), forControlEvents: .TouchUpInside)
        
        copyButton.setTitle(Constants.CopyButtonTitle, forState: .Normal)
        copyButton.setTitleColor(Constants.ShareButtonTitleColor, forState: .Normal)
        copyButton.layer.borderWidth = shareButton.layer.borderWidth
        
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        
        copyButton.heightAnchor.constraintEqualToAnchor(shareButton.heightAnchor).active = true
        copyButton.widthAnchor.constraintEqualToAnchor(shareButton.widthAnchor).active = true
        copyButton.trailingAnchor.constraintEqualToAnchor(shareButton.leadingAnchor).active = true
        copyButton.bottomAnchor.constraintEqualToAnchor(shareButton.bottomAnchor).active = true
    }
    
    private func initPromoCodeTextField() {
        promoCodeTextField = UITextField()
        self.addSubview(promoCodeTextField)
        
        // TO DO: use real promo code later
        promoCodeTextField.text = "iamsocool"
        promoCodeTextField.textAlignment = .Left
        promoCodeTextField.textColor = Constants.PromoCodeTextFieldTextColor
        promoCodeTextField.layer.borderWidth = shareButton.layer.borderWidth
        promoCodeTextField.userInteractionEnabled = false
        
        promoCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        promoCodeTextField.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: -Constants.ShareButtonTrailingConstant).active = true
        promoCodeTextField.trailingAnchor.constraintEqualToAnchor(copyButton.leadingAnchor).active = true
        promoCodeTextField.heightAnchor.constraintEqualToAnchor(copyButton.heightAnchor).active = true
        promoCodeTextField.bottomAnchor.constraintEqualToAnchor(copyButton.bottomAnchor).active = true
    }

    // MARK: - Constants
    
    private struct Constants {
        static let BackgroundColor = UIColor.whiteColor()
        
        static let ShareButtonSelector = "sharePromoCode"
        static let ShareButtonTitle = "Share"
        static let ShareButtonTitleColor = UIColor.blueColor()
        static let ShareButtonHeightConstant = CGFloat(40)
        static let ShareButtonWidthConstant = CGFloat(80)
        static let ShareButtonTrailingConstant = CGFloat(-20)
        static let ShareButtonBottomConstant = CGFloat(-20)
        
        static let CopyButtonSelector = "copyPromoCode"
        static let CopyButtonTitle = "Copy"
        
        static let PromoCodeTextFieldTextColor = UIColor.grayColor()
    }
}
