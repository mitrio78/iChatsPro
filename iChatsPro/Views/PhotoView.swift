//
//  PhotoView.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit

final class PhotoView: UIView {

    private lazy var avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()

    let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.tintColor = .buttonBlack()
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(avatarImage)
        addSubview(plusButton)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: topAnchor),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            plusButton.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
            plusButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
            bottomAnchor.constraint(equalTo: avatarImage.bottomAnchor),
            trailingAnchor.constraint(equalTo: plusButton.trailingAnchor)
        ])
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
    }
}
