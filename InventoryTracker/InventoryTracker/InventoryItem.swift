//
//  InventoryItem.swift
//  InventoryTracker
//
//  Created by Bharath Kumar Potham Shetti on 4/26/25.
//

import Foundation
import  FirebaseFirestore
import FirebaseFirestoreSwift

struct InventoryItem: Identifiable, Codable{
    @DocumentID var id: String?
    var name: String
    var quantity: Int
       
}



