//
//  AddBookView.swift
//  Bookly
//
//  Created by Diego Martin on 12/16/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var review = ""
    @State private var rating = 3
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name of book", text: $title)
                TextField("Author's name", text: $author)
                
                Picker("Genre", selection: $genre) {
                    ForEach(genres, id: \.self) {
                        Text($0)
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        if title.isEmpty {
                            title = "Merry Christmas Default Dan"
                        }
                        if author.isEmpty {
                            author = "Tester"
                        }
                        if genre.isEmpty {
                            genre = "Mystery"
                        }
                        if review.isEmpty {
                            review = "Well this book was never written so..."
                        }
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
