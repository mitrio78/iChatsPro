//
//  PeopleViewController.swift
//  iChatsPro
//
//  Created by anduser on 07.06.2023.
//

import UIKit

final class PeopleViewController: UIViewController {

    private var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSearchBar()
    }
}

extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

fileprivate extension PeopleViewController {
    func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
        searchController = .init()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

// MARK: - Previews

import SwiftUI

struct PeopleControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = MainTabBarController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<PeopleControllerProvider.ContainerView>) -> MainTabBarController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: PeopleControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<PeopleControllerProvider.ContainerView>) {
        }
    }
}
