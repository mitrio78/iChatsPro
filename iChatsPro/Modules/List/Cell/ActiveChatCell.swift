//
//  ActiveChatCell.swift
//  iChatsPro
//
//  Created by anduser on 07.06.2023.
//

import UIKit

final class ActiveChatCell: UICollectionViewCell {

    private lazy var friendImage: UIImageView = {
        let view = UIImageView()
        return view
    }()

    private lazy var friendName: UILabel = {
        let view = UILabel(text: "", font: .laoSangamMN20())
        return view
    }()

    private lazy var lastMessage: UILabel = {
        let view = UILabel(text: "", font: .laoSangamMN18())
        return view
    }()

    private lazy var gradientView: GradientView = {
        let view = GradientView(
            startPoint: .topTrailing,
            endPoint: .bottomLeading,
            colors: [.gradient1, .gradient2]
        )
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        config()
    }
}

extension ActiveChatCell: SelfConfigureCell {
    func configure(with model: any Mo) {
        guard let model = model as? MChat else {
            return
        }
        friendImage.image = UIImage(named: model.userImageString ?? "")
        friendName.text = model.username
        lastMessage.text = model.lastMessage
    }

    static var reuseId: String {
        Self.description()
    }
}

fileprivate extension ActiveChatCell {

    func config() {
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        contentView.addSubview(gradientView)
        contentView.addSubview(friendImage)
        contentView.addSubview(friendName)
        contentView.addSubview(lastMessage)

        contentView.layer.cornerRadius = 4
        contentView.clipsToBounds = true
    }

    func setupConstraints() {
        friendImage.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 86),
            gradientView.widthAnchor.constraint(equalToConstant: 8),

            friendImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            friendImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            friendImage.heightAnchor.constraint(equalToConstant: 86),
            friendImage.widthAnchor.constraint(equalToConstant: 86),

            friendName.leadingAnchor.constraint(equalTo: friendImage.trailingAnchor, constant: 16),
            friendName.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            friendName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16),

            lastMessage.leadingAnchor.constraint(equalTo: friendName.leadingAnchor),
            lastMessage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            lastMessage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
        ])
    }
}

// MARK: - Previews

import SwiftUI

struct ActiveCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = MainTabBarController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<ActiveCellProvider.ContainerView>) -> MainTabBarController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: ActiveCellProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ActiveCellProvider.ContainerView>) {
        }
    }
}
