//
//  SingleLineTextField.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit

final class SingleLineTextField: UITextField {

    private lazy var bottomView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .buttonLightGray()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    convenience init(
        font: UIFont? = .avenir20()
    ) {
        self.init()
        self.font = font
        borderStyle = .none
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomView)

        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
