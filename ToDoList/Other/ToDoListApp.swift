//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 24.06.2025.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
