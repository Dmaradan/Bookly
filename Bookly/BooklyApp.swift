//
//  BooklyApp.swift
//  Bookly
//
//  Created by Diego Martin on 12/15/23.
//

import SwiftData
import SwiftUI

@main
struct BooklyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
