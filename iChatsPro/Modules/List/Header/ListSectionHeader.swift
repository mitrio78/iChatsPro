//
//  ListSectionHeader.swift
//  iChatsPro
//
//  Created by anduser on 07.06.2023.
//

import UIKit

final class ListSectionHeader: UICollectionReusableView {

    static var reuseId: String { Self.description() }

    private lazy var title: UILabel = {
        UILabel()
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.topAnchor.constraint(equalTo: topAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func config(text: String, font: UIFont?, color: UIColor) {
        title.text = text
        title.font = font
        title.textColor = color
    }
}
