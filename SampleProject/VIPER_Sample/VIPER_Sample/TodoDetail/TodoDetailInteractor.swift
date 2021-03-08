//
//  TodoDetailInteractor.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

import Foundation

final class TodoDetailInteractor {
    weak var presenter: TodoDetailInteractorOutputProtocol?
}

extension TodoDetailInteractor: TodoDetailInteractorInputProtocol {
    func fetchTodo(_ todoId: Int) {
        let todo = TodoStore.shared.todos.filter { $0.id == todoId }.first ?? Todo.def
        self.presenter?.didFetchedTodo(todo)
    }
}
