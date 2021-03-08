//
//  TodoDetailRouter.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

import UIKit

final class TodoDetailRouter {
    
    weak var view: TodoDetailViewProtocol?
}

extension TodoDetailRouter: TodoDetailRouterProtocol {
    
    static func assembleModules(_ todoId: Int) -> UIViewController {
        let view = TodoDetailViewController.instatiate()
        let presenter = TodoDetailPresenter()
        let interactor = TodoDetailInteractor()
        let router = TodoDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        presenter.todoId = todoId
        
        return view
    }
}
