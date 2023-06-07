//
//  ListViewController.swift
//  iChatsPro
//
//  Created by anduser on 07.06.2023.
//

import UIKit

final class ListViewController: UIViewController {

    // MARK: - Private Properties

    private var chats: [MChat] = MChat.mockData
    private var waitingChats: [MChat] = MChat.waitingMockData

    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, MChat>!
    private var collectionLayout: UICollectionViewLayout!
    private var searchController: UISearchController!
    private var snapshot: NSDiffableDataSourceSnapshot<Section, MChat>!

    private enum Section: Int, CaseIterable {
        case waitingChats, activeChats
    }

    // MARK: - Inheritance

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupDataSource()
        reloadData()
        setupSearchBar()
    }
}

// MARK: - UICollectionViewDelegate

extension ListViewController: UICollectionViewDelegate { }

// MARK: - UICollectionViewFlowLayout

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: 64)
    }
}

// MARK: - UISearchBarDelegate

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - Private methods

fileprivate extension ListViewController {

    // MARK: - Collection View

    func setupCollectionView() {
        collectionLayout = setupCompositionalLayout()
        collectionView = .init(frame: view.bounds, collectionViewLayout: collectionLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()

        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellW")
    }

    // MARK: - Search bar

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

    func setupCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in

            // layout(section) -> groups -> items -> size
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError()
            }

            switch section {
            case .activeChats:
                return self.createActiveChats()

            case .waitingChats:
                return self.createWaitingChats()
            }
        }
        return layout
    }

    // MARK: - Diffable Data Source

    func setupDataSource() {
        dataSource = .init(collectionView: collectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section")
            }

            switch section {
            case .activeChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                cell.layer.borderWidth = 1
                return cell

            case .waitingChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellW", for: indexPath)
                cell.layer.borderWidth = 1
                cell.layer.borderColor = UIColor.red.cgColor
                return cell
            }
        })
    }

    // MARK: - Snapshot

    func reloadData() {
        snapshot = .init()
        snapshot.appendSections([
            .waitingChats,
            .activeChats
        ])
        snapshot.appendItems(waitingChats, toSection: .waitingChats)
        snapshot.appendItems(chats, toSection: .activeChats)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }

    // MARK: Sections Setup

    func createActiveChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(86)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 16, leading: 20, bottom: .zero, trailing: 20)
        section.interGroupSpacing = 8
        return section
    }

    func createWaitingChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(88),
            heightDimension: .absolute(88)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        section.contentInsets = .init(top: 16, leading: 20, bottom: .zero, trailing: 20)
        return section
    }
}

// MARK: - Previews

import SwiftUI

struct ListControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = MainTabBarController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<ListControllerProvider.ContainerView>) -> MainTabBarController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: ListControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListControllerProvider.ContainerView>) {
        }
    }
}