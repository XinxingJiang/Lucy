//
//  EMMessageUtil.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/20/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import Foundation

class EMMessageUtil {
    class func createTextMessgae(text: String, from: String, to: String) -> EMMessage {
        let messageBody = EMTextMessageBody(text: text)
        return EMMessage(conversationID: "", from: from, to: to, body: messageBody, ext: nil)
    }
    
    class func createImageMessage(data: NSData, from: String, to: String) -> EMMessage {
        let body = EMImageMessageBody(data: data, displayName: "I am an image")
        return EMMessage(conversationID: "", from: from, to: to, body: body, ext: nil)
    }
}