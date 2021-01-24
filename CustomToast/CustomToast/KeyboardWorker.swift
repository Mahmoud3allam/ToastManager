//
//  KeyboardManager.swift
//  CustomToast
//
//  Created by Alchemist on 21/01/2021.
//  Copyright © 2021 Nejmo. All rights reserved.
//

import Foundation
import UIKit
class KeyboardWorker {
    static let sharedInstance = KeyboardWorker()
    private init() {}
    var isKeyboardVisable = false
    var keyBoardHeight: CGFloat = 0
    func startListener(){
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyBoardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyBoardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @objc private func onKeyBoardWillShow(_ notification: Notification) {
        self.isKeyboardVisable = false
        if let keyBoardFrame : NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyBoardFrame.cgRectValue
            self.keyBoardHeight = keyboardRectangle.height
        }
    }
    
    @objc private func onKeyBoardWillHide(_ notification: Notification) {
        self.isKeyboardVisable = false
    }
    
    func stopListener() {
        NotificationCenter.default.removeObserver(self)
    }
}
