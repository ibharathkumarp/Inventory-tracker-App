//
//  ContentView.swift
//  InventoryTracker
//
//  Created by Bharath Kumar Potham Shetti on 4/25/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = InventoryViewModel()
    @State private var name: String = ""
    @State private var quantity: String = ""
    var body: some View {
        NavigationView{
            
            VStack {
                Form{
                    Section(header: Text("Add New Item")){
                        TextField("item name", text: $name)
                        TextField("Quantity", text: $quantity)
                            .keyboardType(.numberPad)
                        Button( action: {
                            if let qty = Int(quantity), !name.isEmpty{
                                viewModel.addItem(name: name, quantity: qty)
                                name = ""
                                quantity = ""
                            }
                        }) {
                            Text("add item")
                        }
                    }
                }
                
                List{
                    ForEach (viewModel.items) { item in
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text("Quantity: \(item.quantity)")
                                .font(.subheadline)
                        }
                        
                    }
                    .onDelete(perform: viewModel.deleteItems) 
                }
            }
                           .navigationTitle("Inventory Tracker")
                       }
                   }
               }
                
#Preview {
    ContentView()
}
