//
//  ToastManager.swift
//  CustomToast
//
//  Created by Alchemist on 21/01/2021.
//  Copyright © 2021 Nejmo. All rights reserved.
//

import Foundation
import UIKit
class ToastManager {
    static let sharedInstance = ToastManager()
    private var toastViews: [ToastView?] = []
    private init(){}
    var toastTopConstraint : NSLayoutConstraint!
    func showToast(with message:String , background:UIColor = .red , textColor: UIColor = .black  , font:UIFont = UIFont.systemFont(ofSize: 20)) {
        print("Views count = \(self.toastViews.count)")
        self.toastViews.forEach({self.removeToastView(toast: $0)})
        if let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) {
            let appearance = ToastAppearance(toastMessage: message, toastBackground: background, toastTextColor: textColor)
            let toastView = ToastView(appearnce: appearance)
            let estimatedHeight = self.calculatingToastHeight(from: message, and: font)
            let height = estimatedHeight > 70 ? estimatedHeight : 70
            toastView.frame = CGRect(x: 0, y: -height, width: window.frame.width, height: height)
            window.addSubview(toastView)
            self.animateToastView(with: height, toast: toastView, window: window)
            
        }
    }
    func calculatingToastHeight(from message:String , and font:UIFont) -> CGFloat {
        let textString = message  as NSString
        let textAttributes : [NSAttributedString.Key : Any] = [.font : font]
        let estimatedTextHeight = textString.boundingRect(with: CGSize(width: 300, height: 2000), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil).height
        return estimatedTextHeight + 10
    }
    private func animateToastView(with height:CGFloat , toast: ToastView , window : UIWindow) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let self = self else {return}
            toast.frame = CGRect(x: 0, y: 0, width: window.frame.width, height: height)
        }) { (_) in
            self.toastViews.append(toast)
            print("Toast Appeared")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                guard let self = self else {return}
                self.removeToastView(toast: toast)
            }
        }
    }
    private func removeToastView(toast : ToastView?){
        guard let toast = toast else {return}
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let self = self else {return}
            toast.transform = CGAffineTransform(translationX: 0, y: -100)
        }) { (_) in
            self.toastViews = self.toastViews.filter({$0 != toast})
            toast.removeFromSuperview()
            print("Toast Appeared")
        }
    }
    
}
