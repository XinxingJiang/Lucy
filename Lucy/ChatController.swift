//
//  ChatController.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/22/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class ChatController: EaseMessageViewController, EaseMessageViewControllerDelegate {

    // MARK: - Fields
    
    var emClient = EMClient.sharedClient()
    var easeChatToolbar: EaseChatToolbar!
    var inputTextView: UITextView!
    var currentUsername: String!
    var showKeyboardButton: UIButton!
    
    // MARK: - VC life cycle
    
    override func loadView() {
        super.loadView()
        navigationItem.title = Constants.NavigationItemTitle
        let leftBarButtomItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: Selector(Constants.LeftBarButtonItemSelector))
        navigationItem.leftBarButtonItem = leftBarButtomItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

        initShowKeyboardButton() // need to add button on top of tableView, so we init it here

        easeChatToolbar = (self.chatToolbar as! EaseChatToolbar)
        inputTextView = easeChatToolbar.inputTextView
        currentUsername = emClient.currentUsername
        
        easeChatToolbar.hidden = true
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraintEqualToAnchor(self.view.topAnchor).active = true
        self.tableView.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
        self.tableView.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor).active = true
        self.tableView.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor).active = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()        
    }
    
    // MARK: - LeftBarButtonItem selector
    
    func cancel() {
        popViewController()
    }
    
    // MARK: - ShowKeyboardButton selector
    
    func showKeyboard() {
        showKeyboardButton.hidden = true
        chatToolbar.hidden = false
    }
    
    // MARK: - Private methods
    
    private func initShowKeyboardButton() {
        showKeyboardButton = UIButton()
        self.tableView.addSubview(showKeyboardButton)
        showKeyboardButton.setImage(Constants.ShowKeyboardButtonImage, forState: .Normal)
        showKeyboardButton.imageEdgeInsets = UIEdgeInsets(top: Constants.ShowKeyboardButtonImageEdgeInset, left: Constants.ShowKeyboardButtonImageEdgeInset, bottom: Constants.ShowKeyboardButtonImageEdgeInset, right: Constants.ShowKeyboardButtonImageEdgeInset)
        showKeyboardButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        showKeyboardButton.layer.cornerRadius = Constants.ShowKeyboardButtonHeightConstant / 2
        showKeyboardButton.layer.borderWidth = Constants.ShowKeyboardButtonBorderWidth
        showKeyboardButton.layer.borderColor = Constants.ShowKeyboardButtonBorderColor
        showKeyboardButton.addTarget(self, action: Selector(Constants.ShowKeyboardButtonSelector), forControlEvents: .TouchUpInside)
        showKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        showKeyboardButton.heightAnchor.constraintEqualToConstant(Constants.ShowKeyboardButtonHeightConstant).active = true
        showKeyboardButton.widthAnchor.constraintEqualToConstant(Constants.ShowKeyboardButtonWidthConstant).active = true
        showKeyboardButton.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor, constant: Constants.ShowKeyboardButtonTrailingConstant).active = true
        showKeyboardButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: Constants.ShowKeyboardButtonBottomConstant).active = true
    }

    // MARK: - Constants
    
    private struct Constants {
        static let NavigationItemTitle = "Lucy"
        static let LeftBarButtonItemSelector = "cancel"
        
        static let ShowKeyboardButtonImage = UIImage(named: "keyboard_icon")
        static let ShowKeyboardButtonImageEdgeInset = CGFloat(5.0)
        static let ShowKeyboardButtonBorderWidth = CGFloat(1.0)
        static let ShowKeyboardButtonBorderColor = UIColor.blueColor().CGColor
        static let ShowKeyboardButtonSelector = "showKeyboard"
        static let ShowKeyboardButtonHeightConstant = CGFloat(40)
        static let ShowKeyboardButtonWidthConstant = Constants.ShowKeyboardButtonHeightConstant
        static let ShowKeyboardButtonTrailingConstant = CGFloat(-10)
        static let ShowKeyboardButtonBottomConstant = Constants.ShowKeyboardButtonTrailingConstant
    }
}
