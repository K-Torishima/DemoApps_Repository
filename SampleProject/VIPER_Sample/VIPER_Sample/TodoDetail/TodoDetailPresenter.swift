//
//  TodoDetailPresenter.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

import Foundation

final class TodoDetailPresenter {
    
    weak var view: TodoDetailViewProtocol?
    var interactor: TodoDetailInteractorInputProtocol?
    var router: TodoDetailRouterProtocol?
    
    var todoId: Int = 0
}

extension TodoDetailPresenter: TodoDetailPresenterProtocol {
    
    func viewWillappear() {
        self.interactor?.fetchTodo(self.todoId)
    }
}

extension TodoDetailPresenter: TodoDetailInteractorOutputProtocol {
    func didFetchedTodo(_ todo: Todo) {
        let viewData = TodoDetailViewData(todoId: todo.id,
                                          title: todo.title,
                                          detail: todo.detail,
                                          isCompleted: todo.isCompleted,
                                          deadLine: todo.deadLine)
        
        self.view?.showTodo(viewData)
    }
}
