//
//  LoginViewController.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit

// MARK: - LoginViewController

final class LoginViewController: UIViewController {

    // MARK: - UI Properties

    private lazy var welcomeLabel: UILabel = {
        UILabel(text: "Welcome back!", font: .avenir26())
    }()

    private lazy var loginWithLabel: UILabel = {
        UILabel(text: "Login with")
    }()

    private lazy var orLabel: UILabel = {
        UILabel(text: "or")
    }()

    private lazy var emailLabel: UILabel = {
        UILabel(text: "Email")
    }()

    private lazy var passwordLabel: UILabel = {
        UILabel(text: "Password")
    }()

    private lazy var needAccountLabel: UILabel = {
        UILabel(text: "Need an account?")
    }()

    private lazy var googleButton: UIButton = {
        UIButton(title: "Sign up", backgroundColor: .white, titleColor: .black, isShadow: true, cornerRadius: 4)
    }()

    private lazy var emailTextField: SingleLineTextField = {
        SingleLineTextField()
    }()

    private lazy var passwordTextField: SingleLineTextField = {
        SingleLineTextField()
    }()

    private lazy var loginButton: UIButton = {
        UIButton(title: "Login", backgroundColor: .buttonBlack(), titleColor: .white, cornerRadius: 4)
    }()

    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.buttonRed(), for: .normal)
        button.titleLabel?.font = .avenir20()
        return button
    }()

    private lazy var loginWithView: TemplateButton = {
        TemplateButton(label: loginWithLabel, button: googleButton)
    }()

    private lazy var emailStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        stack.axis = .vertical
        stack.spacing = .zero
        return stack
    }()

    private lazy var passStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
        stack.axis = .vertical
        stack.spacing = .zero
        return stack
    }()

    private lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            loginWithView,
            orLabel,
            emailStack,
            passStack,
            loginButton
        ])
        stack.axis = .vertical
        stack.spacing = 40
        return stack
    }()

    private lazy var bottomStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [needAccountLabel, signUpButton])
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()

    // MARK: - Inheritance

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Private methods

fileprivate extension LoginViewController {

    func configure() {
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.backgroundColor = .systemBackground
        googleButton.customizeGoogleButton()
        view.addSubview(welcomeLabel)
        view.addSubview(mainStack)
        view.addSubview(bottomStack)
    }

    func setupConstraints() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        bottomStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            bottomStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            bottomStack.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

// MARK: - Previews

import SwiftUI

struct LoginViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let viewController = LoginViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<LoginViewControllerProvider.ContainerView>) -> LoginViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: LoginViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginViewControllerProvider.ContainerView>) {
        }
    }
}
