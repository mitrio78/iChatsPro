//
//  Users.swift
//  iChatsPro
//
//  Created by anduser on 08.06.2023.
//

import Foundation

struct MUser: Hashable, Decodable {
    var username: String
    var avatarStringURL: String
    var id: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func ==(lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }

    static let usersMock: [MUser] = Bundle.main.decode([MUser].self, from: "users.json")
}
