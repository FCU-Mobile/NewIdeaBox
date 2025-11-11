//
//  ContentView.swift
//  IdeaBox
//
//  Created by Harry Ng on 10/1/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddIdea = false

    var body: some View {
        TabView {
            Tab("All", systemImage: "list.bullet") {
                AllIdeasView(showingAddIdea: $showingAddIdea)
            }

            Tab("Completed", systemImage: "checkmark.circle.fill") {
                CompletedIdeasView()
            }

            Tab("Search", systemImage: "magnifyingglass", role: .search) {
                SearchView()
            }
        }
        .sheet(isPresented: $showingAddIdea) {
            AddIdeaSheet()
        }
    }
}

#Preview {
    ContentView()
}
