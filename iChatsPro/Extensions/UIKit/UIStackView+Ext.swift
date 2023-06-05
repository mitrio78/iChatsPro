//
//  UIStackView+Ext.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
