//
//  SettingsController.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/20/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit
import MessageUI

class SettingsController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    // MARK: - Fields
    
    var settingsView: SettingsView!
    var alertController: UIAlertController!
    var invitationController: InvitationController!
    var paymentsController: PaymentsController!
    var shippingController: ShippingController!
    var mailController: MFMailComposeViewController!
    
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
                self.takePhoto()
            }))
            alertController.addAction(UIAlertAction(title: Constants.ActionTitle2, style: .Default, handler: { action in
                self.choosePhoto()
            }))
            alertController.addCancelAction()
        }
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        var image = editingInfo?[UIImagePickerControllerEditedImage] as? UIImage
        if image == nil {
            image = editingInfo?[UIImagePickerControllerOriginalImage] as? UIImage
        }
        settingsView.photoButton.setBackgroundImage(image, forState: .Normal)        
        settingsView.photoButton.setTitle("", forState: .Normal) // clear title
        if picker.sourceType == UIImagePickerControllerSourceType.Camera {
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
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
        case 4:
            if !MFMailComposeViewController.canSendMail() {
                print(Constants.MailServiceNotAvailableMessage)
                return
            }
            if mailController == nil {
                mailController = MFMailComposeViewController()
                mailController.mailComposeDelegate = self
                mailController.setToRecipients(Constants.Recipients)
                mailController.setSubject(String(format: Constants.Subject, getVersion(), getBuild()))
            }
            presentViewController(mailController, animated: true, completion: nil)
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
    
    // MARK: - MFMailComposeViewControllerDelegate
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Private methods
    
    private func takePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let picker = UIImagePickerController()
            picker.sourceType = .Camera
            // if video, check media types
            picker.delegate = self
            picker.allowsEditing = true
            presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    private func choosePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let picker = UIImagePickerController()
            picker.sourceType = .PhotoLibrary
            // if video, check media types
            picker.delegate = self
            picker.allowsEditing = true
            presentViewController(picker, animated: true, completion: {
                print(123)
            })
        }
    }
    
    private func getVersion() -> String {
        // TODO: get real version
        return "1.0"
    }
    
    private func getBuild() -> String {
        // TODO: get real build
        return "1000"
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let BackButtonTitle = "Back"
        
        static let ActionTitle1 = "Take a Photo"
        static let ActionTitle2 = "Add from Photo Library"
        static let ActionTitle3 = "Cancel"
        
        static let MailServiceNotAvailableMessage = "Mail services are not available"
        static let Recipients = ["jiangxinxing09@gmail.com"]
        static let Subject = "Lucy App Feedback (Version: %@ Build: %@)"
    }
}
