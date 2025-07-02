//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 25.06.2025.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                   ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Sil") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Görevler")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true 
                } label: {
                     Image(systemName: "plus")
                }
             }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "xxx")
}
