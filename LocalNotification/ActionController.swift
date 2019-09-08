//
//  ActionController.swift
//  LocalNotification
//
//  Created by Nazim Uddin on 8/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class ActionController: UIViewController {

    let textLabel:UILabel = {
        let label = UILabel()
        label.text = "Wow Send Notification"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var text:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancle", style: .plain, target: self, action: #selector(handleCancel))
        textLabel.text = text
        // ui label design
        self.setupLabelConstraints()
    }
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    func setupLabelConstraints(){
        view.addSubview(textLabel)
        
        //need constraint anchors...
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    

}
