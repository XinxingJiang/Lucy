
//  SignupController.swift
//  Lucy
//
//  Created by Xinxing Jiang on 4/19/16.
//  Copyright © 2016 Palm. All rights reserved.
//

import UIKit

class SignupController: EaseMessageViewController, EaseMessageViewControllerDelegate {
    
    var emClient = EMClient.sharedClient()
    var easeChatToolbar: EaseChatToolbar!
    var inputTextView: EaseTextView!
    var currentUsername: String!
    var name: String!
    var number: String!
    var confirmationCode: String!
    var whatYouWant: String!
    var tellMeMore: String!
    var howMuch: String!
    
    // MARK: - VC life cycle
    
    override func loadView() {
        super.loadView()
        hideNavigationBar = false
        self.navigationItem.title = RobotConstants.WelcomeBotName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        easeChatToolbar = (self.chatToolbar as! EaseChatToolbar)
        inputTextView = easeChatToolbar.inputTextView
        currentUsername = emClient.currentUsername
        
        sendGetYourNameMessage()
    }
    
    // MARK: - EaseMessageViewControllerDelegate
    
    //
    /*
     messageModel.nickname: display name on the chat
     messageModel.avatarImage: avatar 
     messageModel.text: text
     messageModel.message: message
     */
    
    func messageViewController(tableView: UITableView!, cellForMessageModel messageModel: IMessageModel!) -> UITableViewCell! {
//        let cell = EaseMessageCell()
//        cell.ava
        messageModel.nickname = "" // hide nickname
        if messageModel.isSender { // is user
            
        } else { // is Lucy
            messageModel.avatarImage = Constants.LucyAvatar
        }
        return nil
    }
    
    // MARK: - EMChatToolbarDelegate
    
    override func didSendText(text: String!) {
        switch inputTextView.tag {
        case Constants.GetYourNameTag:
            name = text
            super.didSendText(String(format: Constants.GetYourNameResponseMessage, name))
            sendGetYourNameMessage()
        case Constants.GetYourNumberTag:
            number = text
            super.didSendText(String(format: Constants.GetYourNumberResponseMessage, number))
            sendGetYourConfirmationCodeMessage()
        case Constants.GetYourConfirmationCodeTag:
            confirmationCode = text
            super.sendTextMessage(String(format: Constants.GetYourConfimrationCodeResponseMessage, confirmationCode))
            sendGetWantYouWantMessage()
        case Constants.GetWhatYouWantTag:
            whatYouWant = text
            super.didSendText(String(format: Constants.GetWhatYouWantResponseMessage, whatYouWant))
            sendGetDetailsMessage()
        case Constants.TellMeMoreTag:
            tellMeMore = text
            super.didSendText(String(format: Constants.TellMeMoreResponseMessage, tellMeMore))
            sendGetPriceRangeMessage()
        case Constants.GetPriceRangeTag:
            howMuch = text
            super.sendTextMessage(String(format: Constants.HowMuchResponseMessage, howMuch))
            sendProductImageMessage()
        default:
            super.didSendText(text)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private methods
    
    private func sendGetYourNameMessage() {
        let message = EMMessageUtil.createTextMessgae(String(format: Constants.GetYourNameMessage, RobotConstants.WelcomeBotName), from: RobotConstants.WelcomeBotName, to: currentUsername)
        
        emClient.chatManager.asyncSendMessage(message, progress: { code in
            
        }) { (message, error) in
            if error == nil {
                self.inputTextView.placeHolder = Constants.GetYourNamePlaceholder
                self.inputTextView.tag = Constants.GetYourNameTag
            }
        }
    }
    
    private func sendGetYourNumberMessage() {
        let message = EMMessageUtil.createTextMessgae(String(format: Constants.GetYourNumberMessage, name), from: RobotConstants.WelcomeBotName, to: currentUsername)
        emClient.chatManager.asyncSendMessage(message, progress: { code in
            
            }, completion: { (message, error) in
                if error == nil {
                    self.inputTextView.placeHolder = Constants.GetYourNumberPlaceholder
                    self.inputTextView.keyboardType = .NumbersAndPunctuation
                    self.inputTextView.resignFirstResponder() // trigger keyboard type switch
                    self.inputTextView.tag = Constants.GetYourNumberTag
                }
        })
    }
    
    private func sendGetYourConfirmationCodeMessage() {
        let message = EMMessageUtil.createTextMessgae(Constants.GetYourConfirmationCodeMessage, from: RobotConstants.WelcomeBotName, to: currentUsername)
        emClient.chatManager.asyncSendMessage(message, progress: { code in
            
            }, completion: { (message, error) in
                if error == nil {
                    self.inputTextView.placeHolder = Constants.GetYourConfirmationCodePlaceholder
                    self.inputTextView.tag = Constants.GetYourConfirmationCodeTag
                }
        })
    }
    
    private func sendGetWantYouWantMessage() {
        let message = EMMessageUtil.createTextMessgae(Constants.GetWhatYouWantMessage, from: RobotConstants.WelcomeBotName, to: currentUsername)
        emClient.chatManager.asyncSendMessage(message, progress: { code in
            
            }, completion: { (message, error) in
                if error == nil {
                    self.inputTextView.keyboardType = .Default
                    self.inputTextView.resignFirstResponder()
                    self.inputTextView.placeHolder = Constants.DefaultPlaceholder
                    self.inputTextView.tag = Constants.GetWhatYouWantTag
                }
        })
    }
    
    private func sendGetDetailsMessage() {
        let message = EMMessageUtil.createTextMessgae(String(format: Constants.GetDetailsMessage, whatYouWant, RobotConstants.LucyAgent), from: RobotConstants.WelcomeBotName, to: currentUsername)
        emClient.chatManager.asyncSendMessage(message, progress: { code in
            
            }, completion: { (message, error) in
                if error == nil {
                    self.inputTextView.placeHolder = Constants.TellMeMorePlaceholder
                    self.inputTextView.tag = Constants.TellMeMoreTag
                }
        })
    }
    
    private func sendGetPriceRangeMessage() {
        let message = EMMessageUtil.createTextMessgae(Constants.GetPriceRangeMessage, from: RobotConstants.WelcomeBotName, to: currentUsername)
        emClient.chatManager.asyncSendMessage(message, progress: { code in
            
            }, completion: { (message, error) in
                if error == nil {
                    self.inputTextView.placeHolder = Constants.GetPriceRangePlaceholder
                    self.inputTextView.tag = Constants.GetPriceRangeTag
                }
        })
    }
    
    private func sendProductImageMessage() {
        let image = UIImage(named: "blt_sandwich")!
        let data = UIImagePNGRepresentation(image)!
        let message = EMMessageUtil.createImageMessage(data, from: RobotConstants.LucyAgent, to: currentUsername)
        emClient.chatManager.asyncSendMessage(message, progress: { code in
            
            }, completion: { (message, error) in
                if error == nil {
                    
                }
        })
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let GetYourNameTag = 0
        static let GetYourNumberTag = 1
        static let GetYourConfirmationCodeTag = 2
        static let GetWhatYouWantTag = 3
        static let TellMeMoreTag = 4
        static let GetPriceRangeTag = 5
        
        static let LucyAvatar = UIImage(named: "lucy_avatar")
        
        static let BackButtonTitle = "Back"
        static let BackButtonSelector = "back"
        
        static let DefaultPlaceholder = "Write a message..."
        
        static let GetYourNameMessage = "Hi. I'm %@ 👏and I'm here to get you started. Would you be so kind as to introduce yourself?😃"
        static let GetYourNamePlaceholder = "My name is"
        static let GetYourNameResponseMessage = "Hi, my name is %@"
        
        static let GetYourNumberMessage = "Nice to meet you, %@! Next we need your phone 📱 number so we can text you your confirmation code."
        static let GetYourNumberPlaceholder = "Phone Number"
        static let GetYourNumberResponseMessage = "My number is %@"
        
        static let GetYourConfirmationCodeMessage = "Got it! Please enter the 4-digit confirmation code we just sent to the number you entered😊"
        static let GetYourConfirmationCodePlaceholder = "Enter Code"
        static let GetYourConfimrationCodeResponseMessage = "My confirmation code is %@"
        
        static let GetWhatYouWantMessage = "What can we find for you today?😄"
        static let GetWhatYouWantResponseMessage = "I'd like %@"
        
        static let GetDetailsMessage = "Sure, what %@ would you like? From east to the west, %@ can find it for you.😄"
        static let TellMeMorePlaceholder = "Tell me more..."
        static let TellMeMoreResponseMessage = "I'd like %@"
        
        static let GetPriceRangeMessage = "Sure, what price range would you like?😄"
        static let GetPriceRangePlaceholder = "Enter the upper bound"
        static let HowMuchResponseMessage = "No more than %@"
    }
}
