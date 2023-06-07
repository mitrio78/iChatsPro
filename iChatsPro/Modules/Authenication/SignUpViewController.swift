//
//  SignUpViewController.swift
//  iChatsPro
//
//  Created by anduser on 05.06.2023.
//

import UIKit

final class SignUpViewController: UIViewController {

    // MARK: - UI Properties

    private lazy var welcomeLabel: UILabel = {
        UILabel(text: "Good to see you!", font: .avenir26())
    }()

    private lazy var emailLabel: UILabel = {
        UILabel(text: "Email")
    }()

    private lazy var passwordLabel: UILabel = {
        UILabel(text: "Password")
    }()

    private lazy var confirmLabel: UILabel = {
        UILabel(text: "Confirm password")
    }()

    private lazy var alreadyOnboardLabel: UILabel = {
        UILabel(text: "Already onboard?")
    }()

    private lazy var signUpButton: UIButton = {
        UIButton(title: "Sign up", backgroundColor: .buttonBlack(), titleColor: .white, cornerRadius: 4)
    }()

    private lazy var emailTextField: SingleLineTextField = {
        SingleLineTextField()
    }()

    private lazy var passwordTextField: SingleLineTextField = {
        SingleLineTextField()
    }()

    private lazy var confirmTextField: SingleLineTextField = {
        SingleLineTextField()
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.buttonRed(), for: .normal)
        return button
    }()

    private lazy var emailStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        return stack
    }()

    private lazy var passwordStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        return stack
    }()

    private lazy var confirmStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        return stack
    }()

    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var bottomStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Inheritance

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Private methods

fileprivate extension SignUpViewController {

    func configure() {
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.backgroundColor = .systemBackground
        emailStackView.addArrangedSubviews([
            emailLabel,
            emailTextField
        ])
        passwordStackView.addArrangedSubviews([
            passwordLabel,
            passwordTextField
        ])
        confirmStackView.addArrangedSubviews([
            confirmLabel,
            confirmTextField
        ])
        mainStackView.addArrangedSubviews([
            emailStackView,
            passwordStackView,
            confirmStackView,
            signUpButton
        ])
        bottomStackView.addArrangedSubviews([
            alreadyOnboardLabel,
            loginButton
        ])
        view.addSubview(welcomeLabel)
        view.addSubview(mainStackView)
        view.addSubview(bottomStackView)
    }

    func setupConstraints() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            signUpButton.heightAnchor.constraint(equalToConstant: 60),
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            bottomStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor)
        ])
    }
}

// MARK: - Previews

import SwiftUI

struct SignUpViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SignUpViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<SignUpViewControllerProvider.ContainerView>) -> SignUpViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: SignUpViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SignUpViewControllerProvider.ContainerView>) {
        }
    }
}
