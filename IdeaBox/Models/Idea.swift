//
//  Idea.swift
//  IdeaBox
//
//  Created by Harry Ng on 10/1/25.
//

import Foundation
import SwiftData

@Model
class Idea {
    var id: UUID
    var title: String
    var detail: String
    var isCompleted: Bool
    var sortOrder: Int

    init(
        id: UUID = UUID(),
        title: String,
        detail: String,
        isCompleted: Bool = false,
        sortOrder: Int
    ) {
        self.id = id
        self.title = title
        self.detail = detail
        self.isCompleted = isCompleted
        self.sortOrder = sortOrder
    }
}
