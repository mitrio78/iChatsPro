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

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        return stack
    }()

    // MARK: - Inheritance

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Private methods

fileprivate extension AuthViewController {

    func configure() {
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.backgroundColor = .systemBackground
        let googleView = AuthButton(label: googleLabel, button: googleButton)
        let emailView = AuthButton(label: emailLabel, button: eMailButton)
        let loginView = AuthButton(label: alreadyOnboardLabel, button: loginButton)

        stackView.addArrangedSubviews([googleView, emailView, loginView])

        view.addSubview(logoImageView)
        view.addSubview(stackView)
    }

    func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
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
