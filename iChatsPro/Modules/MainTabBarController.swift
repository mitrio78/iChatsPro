//
//  MainTabBarController.swift
//  iChatsPro
//
//  Created by anduser on 07.06.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    private var listVC: ListViewController = .init()
    private var peopleVC: PeopleViewController = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium)

        let peopleImage = UIImage(
            systemName: Constants.peopleIconName,
            withConfiguration: boldConfiguration
        )
        let listImage = UIImage(
            systemName: Constants.listIconImage,
            withConfiguration: boldConfiguration
        )

        tabBar.tintColor = .tabBarIconColor()

        viewControllers = [
            getNavController(rootVC: peopleVC, title: "People", image: peopleImage!),
            getNavController(rootVC: listVC, title: "Chats", image: listImage!)
        ]
    }

    private func getNavController(rootVC: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = image
        return navVC
    }
}

fileprivate extension MainTabBarController {
    enum Constants {
        static let peopleIconName: String = "person.2"
        static let listIconImage: String = "bubble.left.and.bubble.right"
    }
}

// MARK: - Previews

import SwiftUI

struct MainTabBarControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = MainTabBarController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<MainTabBarControllerProvider.ContainerView>) -> MainTabBarController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: MainTabBarControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainTabBarControllerProvider.ContainerView>) {
        }
    }
}
