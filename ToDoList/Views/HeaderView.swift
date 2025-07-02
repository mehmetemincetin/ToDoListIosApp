//
//  HeaderView.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 25.06.2025.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                                
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
                 
            }
            .padding(.top, 110)
             
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y: -150)
    }
}

#Preview {
        HeaderView(title: "Title",
                   subtitle: "Subtitle",
                   angle: 15,
                   background: .blue)
}
