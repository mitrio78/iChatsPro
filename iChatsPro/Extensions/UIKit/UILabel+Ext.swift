//
//  UILabel+Ext.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit

extension UILabel {
    convenience init(
        text: String,
        font: UIFont = .avenir20()
    ) {
        self.init()
        self.text = text
        self.font = font
    }
}
