//
//  TaskDetailViewController.swift
//

import UIKit

final class TaskDetailViewController: UIViewController {
    @IBOutlet private weak var taskNameLabel: UILabel!

    var task: Task!
    var taskPosition: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // タスク名を表示
        taskNameLabel.text = task.name
    }
    
    @IBAction func completeButtonDidTap() {
        // タスクを完了にしてタスク一覧のデータを更新する
        task.complete = true
        AppDelegate.tasks[taskPosition] = task
        
        // 前の画面に戻る
        navigationController?.popViewController(animated: true)
    }
}
