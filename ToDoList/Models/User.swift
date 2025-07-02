//
//  User.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 25.06.2025.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
}
