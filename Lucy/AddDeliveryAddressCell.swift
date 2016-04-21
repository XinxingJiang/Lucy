//
//  AddDeliveryAddressCell.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/21/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class AddDeliveryAddressCell: UITableViewCell {

    // MARK: - Fields
    
    var data: (String, String, String)! { // (label text, textField text, textField placeholder)
        didSet {
            initSubviews()
        }
    }
    var label: UILabel!
    var textField: UITextField!
    
    // MARK: - Private methods
    
    private func initSubviews() {
        initLabel()
        initTextField()
    }
    
    private func initLabel() {
        label = UILabel()
        self.addSubview(label)
        label.text = data.0
        label.font = UIFont.boldSystemFontOfSize(label.font.pointSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: Constants.FullNameLabelLeadingConstant).active = true
        label.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: Constants.FullNameLabelTopConstant).active = true
    }
    
    private func initTextField() {
        textField = UITextField()
        self.addSubview(textField)
        textField.text = data.1
        textField.placeholder = data.2
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraintEqualToAnchor(label.leadingAnchor).active = true
        textField.topAnchor.constraintEqualToAnchor(label.bottomAnchor, constant: Constants.FullNameLabelTopConstant).active = true
    }

    // MARK: - Constants
    
    private struct Constants {
        static let FullNameLabelLeadingConstant = CGFloat(10)
        static let FullNameLabelTopConstant = CGFloat(5)
    }
}
