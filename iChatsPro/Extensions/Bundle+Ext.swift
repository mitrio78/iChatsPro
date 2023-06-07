//
//  Bundle+Ext.swift
//  iChatsPro
//
//  Created by anduser on 07.06.2023.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError()
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError()
        }

        return loaded
    }
}
