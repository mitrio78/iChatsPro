//
//  UIViewController+Ext.swift
//  iChatsPro
//
//  Created by anduser on 08.06.2023.
//

import UIKit

extension UIViewController {
    func configure<T: SelfConfigureCell, U: Hashable>(
        collectionView: UICollectionView,
        cellType: T.Type,
        with model: U,
        for indexPath: IndexPath
    ) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: T.reuseId, for: indexPath) as? T else {
            fatalError()
        }
        cell.configure(with: model)
        return cell
    }
}
