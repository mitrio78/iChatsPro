//
//  UISegmentedControl+Ext.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit

extension UISegmentedControl {
    convenience init(
        _ elements: [String]
    ) {
        self.init()
        elements.enumerated().forEach { self.insertSegment(withTitle: $0.element, at: $0.offset, animated: true) }
    }
}
