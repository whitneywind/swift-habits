//
//  UserModel.swift
//  thrive
//
//  Created on 2/23/24.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Helen")
    ]
}
