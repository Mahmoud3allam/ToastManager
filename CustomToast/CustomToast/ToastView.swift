//
//  ToastView.swift
//  CustomToast
//
//  Created by Alchemist on 21/01/2021.
//  Copyright © 2021 Nejmo. All rights reserved.
//

import Foundation
import UIKit
class ToastView: UIView {
    private lazy var toastLabel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    var toastAttributes = ToastAppearance()
    init(appearnce : ToastAppearance) {
        super.init(frame: .zero)
        self.backgroundColor = appearnce.toastBackground
        self.toastLabel.text = appearnce.toastMessage
        self.toastLabel.font = appearnce.font
        self.toastLabel.textColor = appearnce.toastTextColor
        self.layoutUserInterFace()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func layoutUserInterFace() {
        self.addSubViews()
        self.setupToastLabel()
    }
    private func addSubViews() {
        self.addSubview(self.toastLabel)
    }
    private func setupToastLabel() {
        NSLayoutConstraint.activate([
            self.toastLabel.topAnchor.constraint(equalTo: self.topAnchor , constant: 5),
            self.toastLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 5),
            self.toastLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor ,constant:  -5),
            self.toastLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant: -5)
        ])
    }
}

struct ToastAppearance {
    var toastMessage : String = ""
    var toastBackground : UIColor = .clear
    var toastTextColor : UIColor = .black
    var font: UIFont = UIFont.systemFont(ofSize: 20)
}

