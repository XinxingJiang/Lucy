//
//  ShippingController.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/21/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class ShippingController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Fields
    
    var shippingView: ShippingView!
    var addDeliveryAddressController: AddDeliveryAddressController!
    
    // MARK: - VC life cycles
    
    override func loadView() {
        super.loadView()
        shippingView = ShippingView(parentView: view)
        navigationItem.title = Constants.NavigationItemTitle
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: Selector(HomeController.Constants.LeftBarButtonItemSelector))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector(Constants.RightBarButtonItemSelector))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shippingView.tableView.delegate = self
        shippingView.tableView.dataSource = self
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
    
    // MARK: - RightBarButtonItemSelector
    
    func addDeliveryAddress() {
        if addDeliveryAddressController == nil {
            addDeliveryAddressController = AddDeliveryAddressController()
        }
        pushViewController(viewController: addDeliveryAddressController)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: get # of payment
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)
            cell.textLabel?.text = "Apple Pay"
            cell.detailTextLabel?.text = "Primary Payment Method"
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let NavigationItemTitle = "Delivery Addresses"
        
        static let RightBarButtonItemSelector = "addDeliveryAddress"
    }
}
