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

    private lazy var welcomeLabel: UILabel = {
        UILabel(text: "Setup profile", font: .avenir26())
    }()

    private lazy var fullNameLabel: UILabel = {
        UILabel(text: "Full name")
    }()

    private lazy var aboutMeLabel: UILabel = {
        UILabel(text: "About me")
    }()

    private lazy var genderLabel: UILabel = {
        UILabel(text: "Gender")
    }()

    private lazy var passwordLabel: UILabel = {
        UILabel(text: "Password")
    }()

    private lazy var goToChatsButton: UIButton = {
        UIButton(title: "Go to chats!", backgroundColor: .buttonBlack(), titleColor: .white, cornerRadius: 4)
    }()

    private lazy var fullNameTextField: SingleLineTextField = {
        SingleLineTextField()
    }()

    private lazy var aboutMeTextField: SingleLineTextField = {
        SingleLineTextField()
    }()

    private lazy var genderSegment: UISegmentedControl = {
        let segment = UISegmentedControl(["Male", "Female"])
        return segment
    }()

    private lazy var fullNameStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            fullNameLabel,
            fullNameTextField
        ])
        stack.axis = .vertical
        stack.spacing = .zero
        return stack
    }()

    private lazy var aboutMeStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            aboutMeLabel,
            aboutMeTextField
        ])
        stack.axis = .vertical
        stack.spacing = .zero
        return stack
    }()

    private lazy var genderStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            genderLabel,
            genderSegment
        ])
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()

    private lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            fullNameStack,
            aboutMeStack,
            genderStack,
            goToChatsButton
        ])
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

fileprivate extension ProfileSetupViewController {

    func configure() {
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        view.addSubview(avatarImageView)
        view.addSubview(mainStack)
    }

    func setupConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        goToChatsButton.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            goToChatsButton.heightAnchor.constraint(equalToConstant: 60),
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 40),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
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
