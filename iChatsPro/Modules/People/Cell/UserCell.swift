//
//  UserCell.swift
//  iChatsPro
//
//  Created by anduser on 08.06.2023.
//

import UIKit

final class UserCell: UICollectionViewCell {

    private lazy var userImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    private lazy var userNameLabel: UILabel = {
        let view = UILabel()
        view.font = .laoSangamMN20()
        return view
    }()

    var containerView: UIView = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()
        config()
    }
}

extension UserCell: SelfConfigureCell {

    func configure(with model: any Mo) {
        guard let model = model as? MUser else {
            return
        }
        userNameLabel.text = model.username
        userImageView.image = UIImage(named: model.avatarStringURL)
    }

    static var reuseId: String {
        Self.description()
    }
}

fileprivate extension UserCell {
    func config() {
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        backgroundColor = .white
        addSubview(containerView)
        containerView.addSubview(userImageView)
        containerView.addSubview(userNameLabel)

        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 4)

        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 4
    }

    func setupConstraints() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userImageView.topAnchor.constraint(equalTo: topAnchor),
            userImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            userImageView.heightAnchor.constraint(equalTo: containerView.widthAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 8),
            userNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 8),
            userNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
}

// MARK: - Previews

import SwiftUI

struct UserCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let viewController = MainTabBarController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<UserCellProvider.ContainerView>) -> MainTabBarController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UserCellProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<UserCellProvider.ContainerView>) {
        }
    }
}
