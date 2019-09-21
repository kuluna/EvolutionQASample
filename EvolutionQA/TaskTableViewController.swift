//
//  TaskTableViewController.swift
//

import UIKit

final class TaskTableViewController: UITableViewController {
    // セクションは1つのみ
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // タスクの数だけ
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "TaskCell")
        // タスク名を表示
        cell.textLabel?.text = AppDelegate.tasks[indexPath.row].name
        return cell
    }

    // タスクを選択したときに詳細に飛ぶ
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowTaskDetail", sender: indexPath.row)
    }

    // 詳細に飛ぶときにタスクデータを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTaskDetail",
            let vc = segue.destination as? TaskDetailViewController,
            let row = sender as? Int {
            let task = AppDelegate.tasks[row]
            vc.task = task
            vc.taskPosition = row
        }
    }

    /// 新規タスク登録ダイアログを開きます
    @IBAction func menuAddDidTap(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "新規タスク", message: "", preferredStyle: .alert)
        // 入力用テキストボックスを追加
        alert.addTextField()
        // キャンセルできるようにする
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            // 何も入力されていなかったらタスク登録しない
            guard let newTaskName = alert.textFields?.first?.text?.trimmingCharacters(in: .whitespaces), !newTaskName.isEmpty else {
                return
            }
            
            // 新規タスクを登録
            let newTask = Task(name: newTaskName, complete: false)
            AppDelegate.tasks.append(newTask)
            // リストを再読み込み
            self.tableView.reloadData()
        }))
        
        // ダイアログを表示
        present(alert, animated: true)
    }
}
