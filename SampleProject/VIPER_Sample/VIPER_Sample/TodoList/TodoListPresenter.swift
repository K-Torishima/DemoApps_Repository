//
//  TodoListPresenter.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

import Foundation

final class TodoListPresenter {
    
    weak var view: TodoListViewProtocol?
    var interactor: TodoListInteractorInputProtocol?
    var router: TodoListRouterProtocol?
}

extension TodoListPresenter: TodoListPresenterProtocol {
    
    func viewWillAppear() {
        self.interactor?.fetchTodos()
    }
    
    func didSelectRow(_ todoId: Int) {
        self.router?.transitionToDetailView(todoId)
    }
}

extension TodoListPresenter: TodoListInteractorOutputProtocol {
    func didFetchedTodos(_ todos: [Todo]) {
        var viewDatas = [TodoListViewData]()
        todos.forEach { todo in
            let viewData = TodoListViewData(todoId: todo.id, title: todo.title)
            viewDatas.append(viewData)
        }
        self.view?.showTodos(viewDatas)
    }
}

