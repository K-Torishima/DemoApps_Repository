//
//  TodoListProtocol.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

import Foundation
import UIKit

// VIPERの肝となるView、Presenter、Interactor、Routerそれぞれのプロトコル定義

// ここでTransitionProtocolを継承
//　Viewの実体クラス（TodoListViewController
protocol TodoListViewProtocol: TransitionProtocol {
    var presenter: TodoListPresenterProtocol? { get set }
    func showTodos(_ todos: [TodoListViewData])
}

// Presenterの実体クラス（TodoListPresenter）
protocol TodoListPresenterProtocol: class {
    var view: TodoListViewProtocol? { get set }
    var interactor: TodoListInteractorInputProtocol? { get set }
    var router: TodoListRouterProtocol? { get set }
    
    func viewWillAppear()
    func didSelectRow(_ todoId: Int)
}


// Interactorの実体クラス（TodoListInteractor)
protocol TodoListInteractorInputProtocol: class {
    var presenter: TodoListInteractorOutputProtocol? { get set }
    func fetchTodos()
}

// Presenterの実体クラス（TodoListPresenter)
protocol TodoListInteractorOutputProtocol: class {
    func didFetchedTodos(_ todos: [Todo])
}

// Routerの実体クラス（TodoListRouter）
protocol TodoListRouterProtocol: class {
    static func assembleModules() -> UIViewController
    var view: TodoListViewProtocol? { get set }
    func transitionToDetailView(_ todoId: Int)
}


