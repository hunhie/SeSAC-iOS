//
//  Todo.swift
//  SeSACWeek3
//
//  Created by walkerhilla on 2023/07/29.
//

import Foundation

struct TodoInfo {
  static var todoData: [Todo] = [
    Todo(maintitle: "잔디 봇 만들기", subtitle: "2023.07.29", done: false, like: true),
    Todo(maintitle: "과제하기", subtitle: "2023.07.29", done: false, like: false),
    Todo(maintitle: "Tuist 공부하기", subtitle: "2023.07.29", done: false, like: true),
  ]
}

struct Todo {
  let maintitle: String
  let subtitle: String
  var done: Bool
  var like: Bool
}
