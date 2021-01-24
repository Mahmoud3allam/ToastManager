//
//  ViewController.swift
//  CustomToast
//
//  Created by Alchemist on 21/01/2021.
//  Copyright © 2021 Nejmo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var textField : UITextField = {
       var field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .gray
        self.setupField()
    }
    func setupField(){
        self.view.addSubview(self.textField)
        NSLayoutConstraint.activate([
            self.textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            self.textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            self.textField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            self.textField.heightAnchor.constraint(equalToConstant: 40)
        
        ])
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ToastManager.sharedInstance.showToast(with: "There was an Error During the Payment Process , Please try again later")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            ToastManager.sharedInstance.showToast(with: "There was an Error During the Payment Process , Please try again later or check your internet connection and reachabilityThere was an Error During the Payment Process , Please try again later or check your internet connection and reachabilityThere was an Error During the Payment Process , Please try again later or check your internet connection and reachabilityThere was an Error During the Payment Process , Please try again later or check your internet connection and reachability", background: .black, textColor: .white, font: UIFont.boldSystemFont(ofSize: 20))
        }
    }


}

