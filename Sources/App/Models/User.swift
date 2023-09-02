//
//  User.swift
//
//
//  Created by Kokoro Ibaragi on 2023/09/02.
//

import Foundation

import Fluent
import Vapor

final class User: Model, Content {
  static let schema = "users"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "username")
  var username: String

  @Field(key: "nickname")
  var nickname: String

  @Children(for: \.$author)
  var articles: [Article]

  @Children(for: \.$author)
  var comments: [Comment]

  init() { }

  init(id: UUID? = nil, username: String, nickname: String) {
    self.id = id
    self.username = username
    self.nickname = nickname
  }
}
