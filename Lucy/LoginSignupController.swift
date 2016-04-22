//
//  LoginSignupController.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/18/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class LoginSignupController: UIViewController {

    // MARK: - Fields
    
    var emClient: EMClient = EMClient.sharedClient()
    var loginSignupView: LoginSignupView!
    var homeController: HomeController!
    
    // MARK: - VC life cycle
    
    override func loadView() {
        super.loadView()
        loginSignupView = LoginSignupView(parentView: view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.hideNavigationBar = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Login button selector
    
    func login() {
        if homeController == nil {
            homeController = HomeController()
        }
        pushViewController(viewController: homeController)
    }
    
    // MARK: - Signup button selector
    
    func signup() {
        let signupController = SignupController(conversationChatter: RobotConstants.WelcomeBotName, conversationType: EMConversationTypeChat)
        pushViewController(viewController: signupController)
    }
}
