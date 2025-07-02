//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 25.06.2025.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Lütfen tüm alanları doldurun!"
            
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Lütfen geçerli bir e-posta girin!"
            return false
        }
        return true
    }  
}
