//
//  NotificationProcessor.swift
//  LocalNotification
//
//  Created by Nazim Uddin on 8/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationProcessor {
    
    init(notificationCenter:UNUserNotificationCenter,categoryIdentifier:String,badge:Int, title:String,body:String,timeInterval:Int ,dictionary:[String:String])
    {
        // Content
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = categoryIdentifier
        content.title = title
        content.body = body
        content.badge = badge as NSNumber
        content.sound = UNNotificationSound.default
        content.userInfo = dictionary
        
        // Content image
        let url = Bundle.main.url(forResource: "islam", withExtension: "jpg")
        let attachment = try! UNNotificationAttachment(identifier: "image", url: url!, options: [:])
        content.attachments = [attachment]
        
        // trigger time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(timeInterval), repeats: false)
        
        let identifier = "Main Identifier"
        
        // request
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        // notification action
        let like = UNNotificationAction(identifier: "Like", title: "Like", options: .foreground)
        
        let delete = UNNotificationAction(identifier: "Delete", title: "Delete", options: .destructive)
        
        let category = UNNotificationCategory(identifier: categoryIdentifier, actions: [like,delete], intentIdentifiers: [], options: [])
        
        notificationCenter.setNotificationCategories([category])
        
        // add request to notification center
        notificationCenter.add(request) { (error) in
            if error != nil {
                print("Error: \(error?.localizedDescription ?? "")")
                return
            }
        }
    }
}
