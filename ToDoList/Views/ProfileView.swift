//
//  ProfileView.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 25.06.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    @State private var showLogoutConfirmation = false
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Profil Yükleniyor.")
                }
            }
            
            .navigationTitle("Hesabım")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("İsim:")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("E-Posta:")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Şu tarihten beri:")
                    .bold()
                Text(Date(timeIntervalSince1970: user.joined), format: .dateTime.locale(Locale(identifier: "tr_TR")))
            }
            .padding()
        }
        .padding()
        // Sign out
        Button(action:{
            showLogoutConfirmation = true
            viewModel.logOut()
        }) {
            Text("Çıkış yap")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.red)
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding(.horizontal)
        }
        Spacer()
    }

}

#Preview {
    ProfileView()
}
