//
//  CellProtocol.swift
//  iChatsPro
//
//  Created by anduser on 07.06.2023.
//

import Foundation

protocol SelfConfigureCell {
    static var reuseId: String { get }
    func configure(with model: MChat)
}
