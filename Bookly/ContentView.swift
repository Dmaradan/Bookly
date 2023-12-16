//
//  ContentView.swift
//  Bookly
//
//  Created by Diego Martin on 12/15/23.
//

import SwiftData
import SwiftUI


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    @State private var showingAddScreen = false

    
    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .navigationTitle("Bookly")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
}

#Preview {
    ContentView()
}
