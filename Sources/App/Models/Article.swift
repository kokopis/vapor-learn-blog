//
//  Article.swift
//
//
//  Created by Kokoro Ibaragi on 2023/09/02.
//

import Foundation

import Fluent
import Vapor

final class Article: Model, Content {
  static let schema = "articles"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "title")
  var title: String

  @Parent(key: "authorId")
  var author: User

  @Field(key: "body")
  var body: String

  @Children(for: \.$article)
  var comments: [Comment]
}
