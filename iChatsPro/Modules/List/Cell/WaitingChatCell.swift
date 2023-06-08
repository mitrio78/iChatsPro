//
//  WaitingChatsCell.swift
//  iChatsPro
//
//  Created by anduser on 07.06.2023.
//

import UIKit

final class WaitingChatsCell: UICollectionViewCell {

    private lazy var friendImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        config()
    }
}

extension WaitingChatsCell: SelfConfigureCell {
    static var reuseId: String {
        Self.description()
    }

    func configure(with model: any Mo) {
        guard let model = model as? MChat else {
            return
        }
        
        friendImageView.image = UIImage(named: model.userImageString ?? "")
    }
}


fileprivate extension WaitingChatsCell {
    func config() {
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        layer.cornerRadius = 4
        clipsToBounds = true
        addSubview(friendImageView)
    }

    func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            friendImageView.topAnchor.constraint(equalTo: topAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Previews

import SwiftUI

struct WaitingChatsProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = MainTabBarController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<WaitingChatsProvider.ContainerView>) -> MainTabBarController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: WaitingChatsProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<WaitingChatsProvider.ContainerView>) {
        }
    }
}
