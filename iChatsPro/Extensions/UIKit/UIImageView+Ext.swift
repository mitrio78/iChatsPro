//
//  UIImageView+Ext.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit

extension UIImageView {
    convenience init(
        image: UIImage?,
        contentMode: UIView.ContentMode
    ) {
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
}
