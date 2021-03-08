//
//  Todo.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

import Foundation

// Entity
// 主にData構造

struct Todo {
    let id: Int
    let title: String
    let detail: String
    let isCompleted: Bool
    let deadLine: Date
    let createdOn: Date
    let updatedOn: Date
    
    static let def = Todo(id: 0, title: "", detail: "", isCompleted: false, deadLine: Date(), createdOn: Date(), updatedOn: Date())
}
