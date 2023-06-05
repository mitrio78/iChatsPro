//
//  AuthButton.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit

final class TemplateButton: UIView {

    private var label: UILabel!
    private var button: UIButton!

    init(label: UILabel, button: UIButton) {
        super.init(frame: .zero)
        self.label = label
        self.button = button
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.addSubview(label)
        self.addSubview(button)
        self.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 60),
            bottomAnchor.constraint(equalTo: button.bottomAnchor)
        ])
    }
}
