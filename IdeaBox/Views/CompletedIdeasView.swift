//
//  CompletedIdeasView.swift
//  IdeaBox
//
//  Created by Harry Ng on 10/1/25.
//

import SwiftUI
import SwiftData

struct CompletedIdeasView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var ideas: [Idea]

    var completedIdeas: [Idea] {
        ideas.filter { $0.isCompleted }
    }

    var body: some View {
        NavigationStack {
            Group {
                if completedIdeas.isEmpty {
                    ContentUnavailableView(
                        "No Completed Ideas",
                        systemImage: "checkmark.circle",
                        description: Text("Ideas you mark as complete will appear here")
                    )
                } else {
                    List {
                        ForEach(completedIdeas) { idea in
                            IdeaRow(idea: idea) {
                                toggleCompletion(for: idea)
                            }
                        }
                        .onDelete(perform: deleteIdeas)
                    }
                }
            }
            .navigationTitle("Completed")
        }
    }

    private func toggleCompletion(for idea: Idea) {
        idea.isCompleted.toggle()
        try? modelContext.save()
    }

    private func deleteIdeas(at offsets: IndexSet) {
        for index in offsets {
            let idea = completedIdeas[index]
            modelContext.delete(idea)
        }
        try? modelContext.save()
    }
}

#Preview {
    CompletedIdeasView()
}
