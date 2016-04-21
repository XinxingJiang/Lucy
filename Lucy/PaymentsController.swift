//
//  PaymentsController.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/21/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class PaymentsController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Fields
    
    var paymentsView: PaymentsView!
    
    // MARK: - VC life cycles
    
    override func loadView() {
        super.loadView()
        paymentsView = PaymentsView(parentView: view)
        navigationItem.title = Constants.NavigationItemTitle
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: Selector(HomeController.Constants.LeftBarButtonItemSelector))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector(Constants.RightBarButtonItemSelector))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentsView.tableView.delegate = self
        paymentsView.tableView.dataSource = self
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
    
    func addPaymentMethod() {
        // TODO: go to add payment method page
        print("TODO: go to add payment method page")
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
            cell.imageView?.image = Constants.ApplePayImage
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
        static let NavigationItemTitle = "Payment Methods"
        
        static let RightBarButtonItemSelector = "addPaymentMethod"
        
        static let ApplePayImage = UIImage(named: "apple_pay")
        
//        static let SuccessfulCopyMessage = "✅Copied to clipboard."
        
//        static let CancelActionTitle = "Cancel"
    }
}
