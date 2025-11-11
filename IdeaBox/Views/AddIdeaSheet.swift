//
//  AddIdeaSheet.swift
//  IdeaBox
//
//  Created by Harry Ng on 10/1/25.
//

import SwiftUI
import SwiftData

struct AddIdeaSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var title = ""
    @State private var detail = ""

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                        .font(.headline)

                    TextField("Detail", text: $detail, axis: .vertical)
                        .lineLimit(3...6)
                        .font(.body)
                }
            }
            .navigationTitle("New Idea")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let sortOrder = (try? modelContext.fetch(FetchDescriptor<Idea>()).count) ?? 0
                        let newIdea = Idea(title: title, detail: detail, sortOrder: sortOrder)
                        modelContext.insert(newIdea)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddIdeaSheet ()
}
