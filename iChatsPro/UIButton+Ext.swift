//
//  UIButton+Ext.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit

extension UIButton {
    convenience init(
        title: String,
        titleFont: UIFont = .avenir20(),
        backgroundColor: UIColor,
        titleColor: UIColor,
        isShadow: Bool = false,
        cornerRadius: CGFloat = 4
    ) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = titleFont
        self.layer.cornerRadius = cornerRadius
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
}
