//
//  CreateComment.swift
//  
//
//  Created by Kokoro Ibaragi on 2023/09/02.
//

import Foundation
import Fluent

struct CreateComment: AsyncMigration {
  func prepare(on database: Database) async throws {
    try await database.schema("comments")
      .id()
      .field("authorId", .uuid, .required, .references("users", "id"))
      .field("articleId", .uuid, .required, .references("articles", "id"))
      .field("body", .string, .required)
      .field("createdAt", .datetime, .required)
      .field("updatedAt", .datetime, .required)
      .create()
  }

  func revert(on database: Database) async throws {
    try await database.schema("comments").delete()
  }
}

