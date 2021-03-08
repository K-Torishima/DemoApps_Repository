//
//  TodoListRouter.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

import UIKit

final class TodoListRouter {
    weak var view: TodoListViewProtocol?
}

extension TodoListRouter: TodoListRouterProtocol {
    
    static func assembleModules() -> UIViewController {
        let view = TodoListViewController.instantiate()
        let presenter = TodoListPresenter()
        let interactor = TodoListInteracter()
        let router = TodoListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
    func transitionToDetailView(_ todoId: Int) {
        let detailView = TodoDetailRouter.assembleModules(todoId)
        self.view?.pushViewController(detailView, animated: true)
    }
}
