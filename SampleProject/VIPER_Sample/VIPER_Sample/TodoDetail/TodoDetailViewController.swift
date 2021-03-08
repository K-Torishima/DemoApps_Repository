//
//  TodoDetailViewController.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

import UIKit

final class TodoDetailViewController: UIViewController {
    
    static func instatiate() -> TodoDetailViewController {
        let storyboard = UIStoryboard(name: "TodoDetail", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "TodoDetailViewController") as? TodoDetailViewController
        return view ?? TodoDetailViewController()
    }
    
    var presenter: TodoDetailPresenterProtocol?
    var viewData = TodoDetailViewData(todoId: 0, title: "", detail: "", isCompleted: false, deadLine: Date()) {
        didSet {
            titleLabel.text = viewData.title
            detailLabel.text = viewData.detail
            statusLabel.text = viewData.isCompleted ? "完了" : "未完了"
            detailLabel.text = viewData.deadLine.description
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var deadLineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillappear()
    }
}

extension TodoDetailViewController: TodoDetailViewProtocol {
    func showTodo(_ todo: TodoDetailViewData) {
        self.viewData = todo
    }
}
