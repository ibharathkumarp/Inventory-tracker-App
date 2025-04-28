//
//  InventoryViewModel.swift
//  InventoryTracker
//
//  Created by Bharath Kumar Potham Shetti on 4/26/25.
//

import Foundation
import FirebaseFirestore
import Firebase
import SwiftUI


class InventoryViewModel: ObservableObject {
    
    @Published var items: [InventoryItem] = []
    private var db = Firestore.firestore()
    
    init(){
        fetchItems()
    }
    func fetchItems(){
        db.collection("inventory").addSnapshotListener{ snapshot, error in
            guard let documents = snapshot?.documents else{
                print("No documents")
                return
            }
            self.items = documents.compactMap { doc -> InventoryItem? in
                try? doc.data(as: InventoryItem.self)
                
            }
        }
    }
    func addItem(name: String, quantity: Int){
        let newItem = InventoryItem(name: name, quantity: quantity)
        do{
            _ = try db.collection("inventory").addDocument(from: newItem)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    func deleteItems(at offsets: IndexSet){
        offsets.forEach { index in
            let items = items[index]
            if let id = items.id{
                db.collection("inventory").document(id).delete{ error in
                    if let error = error {
                        print("Error deleting document: \(error.localizedDescription)" )

                    }
                    else{
                        print("Document successfully deleted!")
                    }
                }
            }
            
        }
    }
}
