//
//  File.swift
//
//
//  Created by Kokoro Ibaragi on 2023/09/02.
//

import Foundation

import Fluent
import Vapor

final class Comment: Model, Content {
  static let schema = "comments"

  @ID(key: .id)
  var id: UUID?

  @Parent(key: "authorId")
  var author: User

  @Parent(key: "articleId")
  var article: Article

  @Field(key: "body")
  var body: String
}
