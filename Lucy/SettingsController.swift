//
//  SettingsController.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/20/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    // MARK: - Fields
    
    var settingsView: SettingsView!
    var alertController: UIAlertController!
    
    // MARK: - VC life cycle

    override func loadView() {
        super.loadView()
        settingsView = SettingsView(parentView: view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar = false
        setBackButtonTitle(title: Constants.BackButtonTitle)
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
            alertController.addAction(UIAlertAction(title: Constants.ActionTitle3, style: .Cancel, handler: nil))
        }
        presentViewController(alertController, animated: true, completion: nil)
    }

    // MARK: - Constants
    
    private struct Constants {
        static let BackButtonTitle = "Back"
        
        static let ActionTitle1 = "Take a Photo"
        static let ActionTitle2 = "Add from Photo Library"
        static let ActionTitle3 = "Cancel"
    }
}
