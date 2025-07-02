//
//  TLButton.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 27.06.2025.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    
    var body: some View {
        Button {
            action()
        }label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                
                Text(title)
                    .bold()
                    .foregroundColor(.white)
            }
            
        }
    }
}

#Preview {
    TLButton(title: "Value",
             background: .pink)
    {
    }
}
