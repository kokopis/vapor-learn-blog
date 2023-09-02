//
//  CreateArticle.swift
//
//
//  Created by Kokoro Ibaragi on 2023/09/02.
//

import Foundation
import Fluent

struct CreateArticle: AsyncMigration {
  func prepare(on database: Database) async throws {
    try await database.schema("articles")
      .id()
      .field("title", .string, .required)
      .field("authorId", .uuid, .required, .references("users", "id"))
      .field("body", .string, .required)
      .field("createdAt", .datetime, .required)
      .field("updatedAt", .datetime, .required)
      .create()
  }

  func revert(on database: Database) async throws {
    try await database.schema("articles").delete()
  }
}
