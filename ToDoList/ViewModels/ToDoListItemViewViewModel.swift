//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Mehmet Emin Çetin on 25.06.2025.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// ViewModel for single to do list item view (each row in items list)
class ToDoListItemViewViewModel: ObservableObject {
    
    init() {
        
    }
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}


