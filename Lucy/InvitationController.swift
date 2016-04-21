//
//  InvitationController.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/21/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class InvitationController: UIViewController {

    // MARK: - Fields
    
    var invitationView: InvitationView!
    var alertController: UIAlertController!
    
    // MARK: - VC life cycles
    
    override func loadView() {
        super.loadView()
        invitationView = InvitationView(parentView: view)
        navigationItem.title = Constants.NavigationItemTitle
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: Selector(HomeController.Constants.LeftBarButtonItemSelector))
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        hideNavigationBar = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - LeftBarButtonItem selector
    
    func clickSettings() {
        popViewController()
    }
    
    // MARK: - CopyButton selector
    
    func copyPromoCode() {
        UIPasteboard.generalPasteboard().string = invitationView.promoCodeTextField.text!
        showDismissAlertController(alertTitle: Constants.SuccessfulCopyMessage)
    }
    
    // MARK: - ShareButton selector
    
    func sharePromoCode() {
        if alertController == nil {
            alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            alertController.addCancelAction()
        }
        presentViewController(alertController, animated: true, completion: nil)
    }

    // MARK: - Constants
    
    private struct Constants {
        static let NavigationItemTitle = "Invite Friends"
        
        static let SuccessfulCopyMessage = "✅Copied to clipboard."
        
        static let CancelActionTitle = "Cancel"
    }
}
