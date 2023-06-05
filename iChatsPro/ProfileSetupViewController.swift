//
//  ProfileSetupViewController.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit


// MARK: - AuthViewController

final class ProfileSetupViewController: UIViewController {

    // MARK: - UI Properties

    private lazy var avatarImageView: PhotoView = {
        PhotoView()
    }()

    // MARK: - Inheritance

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Private methods

fileprivate extension ProfileSetupViewController {

    func configure() {
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.backgroundColor = .systemBackground

        view.addSubview(avatarImageView)
    }

    func setupConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

import SwiftUI

struct ProfileSetupViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = ProfileSetupViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<ProfileSetupViewControllerProvider.ContainerView>) -> ProfileSetupViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: ProfileSetupViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ProfileSetupViewControllerProvider.ContainerView>) {
        }
    }
}
