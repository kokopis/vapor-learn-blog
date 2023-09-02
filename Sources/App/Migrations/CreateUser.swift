//
//  CreateUser.swift
//
//
//  Created by Kokoro Ibaragi on 2023/09/02.
//

import Foundation
import Fluent

struct CreateUser: AsyncMigration {
  func prepare(on database: Database) async throws {
    try await database.schema("users")
      .id()
      .field("username", .string, .required)
      .unique(on: "username")
      .field("nickname", .string, .required)
      .field("createdAt", .datetime, .required)
      .field("updatedAt", .datetime, .required)
      .create()
  }

  func revert(on database: Database) async throws {
    try await database.schema("users").delete()
  }
}

