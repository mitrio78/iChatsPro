//
//  MChatItem.swift
//  iChatsPro
//
//  Created by anduser on 07.06.2023.
//

import UIKit

struct MChat: Hashable, Decodable {
    var username: String
    var userImageString: String?
    var lastMessage: String?
    var id: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func ==(lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }

    static let mockData: [MChat] = Bundle.main.decode([MChat].self, from: "activeChats.json")
    static let waitingMockData: [MChat] = Bundle.main.decode([MChat].self, from: "waitingChats.json")
}
