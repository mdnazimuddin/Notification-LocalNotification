//
//  ViewController.swift
//  LocalNotification
//
//  Created by Nazim Uddin on 7/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate {

    let button:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send Notification", for: .normal)
        button.addTarget(self, action: #selector(handleActionNotificationButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let textField:UITextField = {
        let nameField = UITextField()
        nameField.placeholder = "@notification message"
        nameField.textAlignment = .center
        nameField.translatesAutoresizingMaskIntoConstraints = false
        return  nameField
    }()
    let notificationCenter = UNUserNotificationCenter.current()
    let categoryIdentifier = "My Category Identifier"
    let notificationBadge = 1
    let notificationTitle = "Local Notification"
    let notificationBody = "This is create examole of Local Notification"
    var dic = [String:String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //ui design
        self.setupButtonConstraints()
        self.setupTextFieldConstraints()
        // notification ..
        self.notificationCenter.delegate = self
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let actionController = ActionController()
        if let dic = response.notification.request.content.userInfo as? [AnyHashable:Any]{
            actionController.text = dic["name"] as? String
        }
        let navContriller = UINavigationController(rootViewController: actionController)
        present(navContriller, animated: true)
    }
    @objc func handleActionNotificationButton()
    {
        guard let name = textField.text else {return}
        dic = ["name":name]
       let notification = NotificationProcessor(notificationCenter: notificationCenter, categoryIdentifier: categoryIdentifier, badge: notificationBadge, title: notificationTitle, body: notificationBody, timeInterval: 5,dictionary: dic)
        textField.text = ""
        print(notification)
    }

}

extension ViewController{
    
    func setupButtonConstraints()
    {
        view.addSubview(button)
        
        //need x,y,z,width,height anchors
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    func setupTextFieldConstraints()
    {
        view.addSubview(textField)
        
        //need x,y,z,width,height anchors
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20).isActive = true
        textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
