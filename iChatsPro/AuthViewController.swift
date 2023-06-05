//
//  ViewController.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit

// MARK: - AuthViewController

class AuthViewController: UIViewController {

    // MARK: - UI Properties

    private lazy var logoImageView: UIImageView = {
        UIImageView(image: UIImage(named: "logo"), contentMode: .scaleAspectFit)
    }()

    private lazy var googleLabel: UILabel = {
        UILabel(text: "Get started with")
    }()

    private lazy var emailLabel: UILabel = {
        UILabel(text: "Or sign up with")
    }()

    private lazy var alreadyOnboardLabel: UILabel = {
        UILabel(text: "Already onboard?")
    }()

    private lazy var googleButton: UIButton = {
        UIButton(
            title: "Google",
            backgroundColor: .white,
            titleColor: .black,
            isShadow: true
        )
    }()

    private lazy var eMailButton: UIButton = {
        UIButton(
            title: "Email",
            backgroundColor: .buttonBlack(),
            titleColor: .white
        )
    }()

    private lazy var loginButton: UIButton = {
        UIButton(
            title: "Login",
            backgroundColor: .white,
            titleColor: .buttonRed(),
            isShadow: true
        )
    }()

    // MARK: - Inheritance

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}

// MARK: - SwiftUI Preview

import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = AuthViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthViewControllerProvider.ContainerView>) -> AuthViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: AuthViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AuthViewControllerProvider.ContainerView>) {
        }
    }
}
