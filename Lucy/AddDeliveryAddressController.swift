//
//  AddDeliveryAddressController.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/21/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class AddDeliveryAddressController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Fields
    
    var addDeliveryAddressView: AddDeliveryAddressView!
    
    // MARK: - VC life cycle
    
    override func loadView() {
        super.loadView()
        addDeliveryAddressView = AddDeliveryAddressView(parentView: view)
        navigationItem.title = Constants.NavigationItemTitle
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: Selector(Constants.LeftBarButtonItemSelector))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: Selector(Constants.RightBarButtonItemSelector))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDeliveryAddressView.tableView.delegate = self
        addDeliveryAddressView.tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.TableViewRowNumber
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = AddDeliveryAddressCell()
        cell.data = (Constants.TableViewCellLabelTexts[indexPath.row], "", Constants.TableViewCellTextFieldPlaceholders[indexPath.row])
        switch indexPath.row {
        case 0:
            cell.data.1 = getFullName()
        case 1:
            cell.data.1 = getAddress()
        case 2:
            cell.data.1 = getCity()
        case 3:
            cell.data.1 = getPhone()
        default:
            ()
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Constants.TableViewCellHeight
    }
    
    // MARK: - LeftBarButtonItem selector
    
    func cancel() {
        popViewController()
    }
    
    // MARK: - RightBarButtonItem selector
    
    func save() {
        // TODO: save to database
    }
    
    // MARK: - Private methods
    
    private func getFullName() -> String {
        // TODO: return user's full name
        return "Xinxing Jiang"
    }
    
    private func getAddress() -> String {
        // TODO: return user's address
        return ""
    }
    
    private func getCity() -> String {
        // TODO: return user's city
        return ""
    }
    
    private func getPhone() -> String {
        // TODO: return user's phone
        return ""
    }

    // MARK: - Constants
    
    struct Constants {
        static let NavigationItemTitle = "Add Shipping Address"

        static let LeftBarButtonItemSelector = "cancel"
        static let RightBarButtonItemSelector = "save"
        
        static let TableViewCellIdentifier = "AddDeliveryAddressCell"
        
        static let TableViewCellLabelTexts = ["FULL NAME", "ADDRESS", "CITY", "PHONE"]
        static let TableViewCellTextFieldPlaceholders = ["Xinxing Jiang", "Wenjin Internation Apartment, Room 123", "Beijing", "1234567890"]
        static let TableViewRowNumber = Constants.TableViewCellLabelTexts.count
        static let TableViewCellHeight = CGFloat(55)

    }
}
