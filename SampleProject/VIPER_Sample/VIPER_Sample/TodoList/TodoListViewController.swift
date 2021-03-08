//
//  TodoListViewController.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

//　原則としてUserからのアクションを検知したり、画面の更新を行うだけを責務とし、ロジック的な処理は行わないのが基本である
//　下記CodeのViewWillapperではPresenterにViewの表示を通知し、Presenter側で必要な処理を行い、showTodosがPresenter側から呼ばれると更新が走る
//　画面表示に必要なデータはTodoListDataという構造体を定義して、Entityを直接参照するような形を避けている

import UIKit

final class TodoListViewController: UIViewController {
    
    static func instantiate() -> TodoListViewController {
        let storyboard = UIStoryboard(name: "TodoList", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "TodoListViewController") as? TodoListViewController
        
        return view ?? TodoListViewController()
    }
    
    var presenter: TodoListPresenterProtocol?
    var viewDatas = [TodoListViewData]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter?.viewWillAppear()
    }
}

//MARK:- TodoListViewProtocol
extension TodoListViewController: TodoListViewProtocol {
    
    func showTodos(_ todos: [TodoListViewData]) {
        self.viewDatas = todos
    }
    
}

//MARK:- TableView
extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath) as? TodoListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel?.text = self.viewDatas[indexPath.row].title
        return cell
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoId = self.viewDatas[indexPath.row].todoId
        self.presenter?.didSelectRow(todoId)
    }
}
