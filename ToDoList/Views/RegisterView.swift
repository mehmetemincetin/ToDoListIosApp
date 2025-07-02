//
//  RegisterView.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 25.06.2025.
//
import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()

    var body: some View {
        VStack {
            
            // Header
            if #available(iOS 16.0, *) {
                HeaderView(title: "Kayıt Ol",
                           subtitle: "Yapılacakları düzenlemeye başlayın",
                           angle: -15,
                           background: .orange)
            } else {
                // Fallback on earlier versions
            }
            
            Form {
                TextField("Tam isim", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    
                TextField("E-Posta ", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Şifre", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Kayıt Ol",
                         background: .green
                ) {
                    viewModel.register()
                }
                .padding()
            }
            
            .offset(y: -40)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
