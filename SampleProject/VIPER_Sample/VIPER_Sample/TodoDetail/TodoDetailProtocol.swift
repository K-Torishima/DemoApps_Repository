//
//  TodoDetailProtocol.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

import UIKit

protocol TodoDetailViewProtocol: TransitionProtocol {
    var presenter: TodoDetailPresenterProtocol? { get set }
    func showTodo(_ todo: TodoDetailViewData)
}

protocol TodoDetailPresenterProtocol: class {
    var view: TodoDetailViewProtocol? { get set }
    var interactor: TodoDetailInteractorInputProtocol? { get set }
    var router: TodoDetailRouterProtocol? { get set }
    
    func viewWillappear()
}

protocol TodoDetailInteractorInputProtocol: class {
    var presenter: TodoDetailInteractorOutputProtocol? { get set }
    func fetchTodo(_ todoId: Int)
}

protocol TodoDetailInteractorOutputProtocol: class {
    func didFetchedTodo(_ todo: Todo)
}

protocol TodoDetailRouterProtocol: class {
    static func assembleModules(_ todoId: Int) -> UIViewController
    var view: TodoDetailViewProtocol? { get set }
}
