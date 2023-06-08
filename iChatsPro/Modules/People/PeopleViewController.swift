//
//  PeopleViewController.swift
//  iChatsPro
//
//  Created by anduser on 07.06.2023.
//

import UIKit

final class PeopleViewController: UIViewController {

    private var users: [MUser] = MUser.usersMock
    private var searchController: UISearchController!

    private var collectionView: UICollectionView!
    private var collectionLayout: UICollectionViewCompositionalLayout!
    private var dataSource: UICollectionViewDiffableDataSource<Section, MUser>!
    private var snapshot: NSDiffableDataSourceSnapshot<Section, MUser>!

    // MARK: - Private Section

    enum Section: Int, CaseIterable {
        case users

        func description(usersCount: Int) -> String {
            switch self {
            case .users:
                return "\(usersCount) people near"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        setupSearchBar()
        setupCollectionView()
        createDataSource()
        reloadData()
    }
}

extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

fileprivate extension PeopleViewController {

    // MARK: - Collection View

    func setupCollectionView() {
        collectionLayout = setupCompositionalLayout()
        collectionView = .init(frame: view.bounds, collectionViewLayout: collectionLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()

        view.addSubview(collectionView)
        collectionView.register(
            UserCell.self,
            forCellWithReuseIdentifier: UserCell.reuseId
        )
        collectionView.register(
            ListSectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ListSectionHeader.reuseId
        )
    }

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

    // MARK: - Compositional Layout

    func setupCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in

            // layout(section) -> groups -> items -> size
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError()
            }

            switch section {
            case .users:
                return self.createUsersSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }

    func createDataSource() {
        dataSource = .init(collectionView: collectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError()
            }

            switch section {
            case .users:
                return self.configure(
                    collectionView: collectionView,
                    cellType: UserCell.self,
                    with: self.users[indexPath.item],
                    for: indexPath
                )
            }
        })
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) -> UICollectionReusableView in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ListSectionHeader.reuseId, for: indexPath) as? ListSectionHeader else {
                fatalError()
            }

            guard let section = Section(rawValue: indexPath.section) else {
                fatalError()
            }

            let itemsCount = self.dataSource.snapshot().numberOfItems(inSection: .users)
            sectionHeader.config(
                text: section.description(usersCount: itemsCount),
                font: .laoSangamMN20(),
                color: .sectionHeader
            )
            return sectionHeader
        }
    }

    func createUsersSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.6)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 2
        )
        group.interItemSpacing = .fixed(16)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = .init(top: 16, leading: 15, bottom: 0, trailing: 15)
        section.boundarySupplementaryItems = [
            createSectionHeader()
        ]
        return section
    }

    // MARK: - Snapshot

    func reloadData() {
        snapshot = .init()
        snapshot.appendSections([
            .users
        ])
        snapshot.appendItems(users, toSection: .users)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }

    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(16)
        )
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
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
