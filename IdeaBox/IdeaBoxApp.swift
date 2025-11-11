//
//  IdeaBoxApp.swift
//  IdeaBox
//
//  Created by Harry Ng on 10/1/25.
//

import SwiftUI
import SwiftData

@main
struct IdeaBoxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Idea.self)
        }
    }
}
