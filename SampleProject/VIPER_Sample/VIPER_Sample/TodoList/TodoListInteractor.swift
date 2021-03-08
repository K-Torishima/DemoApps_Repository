//
//  TodoListInteractor.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

import Foundation

final class TodoListInteracter {
    
    weak var presenter: TodoListInteractorOutputProtocol?
}

extension TodoListInteracter: TodoListInteractorInputProtocol {
    func fetchTodos() {
        let todos = TodoStore.shared.todos
        self.presenter?.didFetchedTodos(todos)
    }
}
