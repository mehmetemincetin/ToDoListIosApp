//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 25.06.2025.
//

import SwiftUI

struct ToDoListItemView: View {
    @State var item: ToDoListItem
    @StateObject var viewModel = ToDoListItemViewViewModel()
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            Button {
                item.isDone.toggle()
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: ToDoListItem(
        id: "123",
        title: "Get milk",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false))
}
