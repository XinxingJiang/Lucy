//
//  SettingsController.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/20/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class SettingsController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Fields
    
    var settingsView: SettingsView!
    var alertController: UIAlertController!
    var invitationController: InvitationController!
    var paymentsController: PaymentsController!
    var shippingController: ShippingController!
    
    // MARK: - VC life cycle

    override func loadView() {
        super.loadView()
        settingsView = SettingsView(parentView: view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView.settingsTableView.delegate = self
        settingsView.settingsTableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - PhotoButton Selector
    
    func clickPhotoButton() {
        if alertController == nil {
            alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            alertController.addAction(UIAlertAction(title: Constants.ActionTitle1, style: .Default, handler: { action in
                
            }))
            alertController.addAction(UIAlertAction(title: Constants.ActionTitle2, style: .Default, handler: { action in
                
            }))
            alertController.addCancelAction()
        }
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            popViewController()
        case 1:
            if invitationController == nil {
                invitationController = InvitationController()
            }
            pushViewController(viewController: invitationController)
        case 2:
            if paymentsController == nil {
                paymentsController = PaymentsController()
            }
            pushViewController(viewController: paymentsController)
        case 3:
            if shippingController == nil {
                shippingController = ShippingController()
            }
            pushViewController(viewController: shippingController)
        default:
            print("cool")
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsView.Constants.SettingsTableViewCellNumber
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = SettingsView.Constants.SettingsTexts[indexPath.row]
        return cell
    }        
    
    // MARK: - Constants
    
    private struct Constants {
        static let BackButtonTitle = "Back"
        
        static let ActionTitle1 = "Take a Photo"
        static let ActionTitle2 = "Add from Photo Library"
        static let ActionTitle3 = "Cancel"
    }
}
