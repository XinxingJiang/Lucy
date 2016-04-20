//
//  HomeController.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/20/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    var homeView: HomeView!
    var settingsController: SettingsController!
    
    // MARK: - VC life cycle
    
    override func loadView() {
        super.loadView()
        homeView = HomeView(parentView: view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        hideNavigationBar = false
        navigationItem.title = Constants.NavigationTitle
        let leftBarButtonItem = UIBarButtonItem(title: Constants.LeftBarButtonItemTitle, style: .Plain, target: self, action: Selector(Constants.LeftBarButtonItemSelector))
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - LeftBarButtonItem selector
    
    func clickSettings() {
        if settingsController == nil {
            settingsController = SettingsController()
        }
        pushViewController(viewController: settingsController)
    }

    // MARK: - Constants
    
    struct Constants {
        static let NavigationTitle = "Lucy"
        static let LeftBarButtonItemTitle = "Settings"
        static let LeftBarButtonItemSelector = "clickSettings"
    }
}
