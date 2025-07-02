//
//  LoginView.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 25.06.2025.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {

                // Header
                    HeaderView(
                        title: "Görevler",
                        subtitle: "İşe koyul",
                        angle: 15,
                        background: Color("AppPrimaryColor")
                    )
                
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("E-Posta", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Şifre", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())

                    TLButton(
                        title: "Giriş Yap",
                        background: .blue,
                    ) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: 50)
                // Create Account
                VStack {
                    Text("Yeni misin")
                        .bold()
                        .font(.system(size: 20))
                    NavigationLink(
                        "Hesap oluştur",
                        destination: RegisterView()
                    )
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}

