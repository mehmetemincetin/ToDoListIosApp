//
//  ContentView.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 24.06.2025.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Görevler", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Hesabım", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
