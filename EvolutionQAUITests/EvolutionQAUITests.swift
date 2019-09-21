import XCTest

class EvolutionQAUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testExample() {
        print("----- テスト開始 -----")
        mainFirstView()
        addTask()
        completeTask()
        print("----- テスト終了 -----")
    }
    
    func mainFirstView() {
        print("ナビゲーションバーはあるか？")
        let navigationBar = app.navigationBars["Tasks"]
        XCTAssert(navigationBar.exists)
        
        print("+ボタンはあるか？")
        let addButton = navigationBar.buttons["Add"]
        XCTAssert(addButton.exists)
        
        print("タスクは0件か？")
        XCTAssert(app.tableRows.count == 0)
    }
    
    func addTask() {
        print("追加ボタンを押す")
        let addButton = app.buttons["Add"]
        addButton.tap()
        
        print("タスク名を入力する")
        let textField = app.alerts.textFields.firstMatch
        XCTAssert(textField.exists)
        textField.typeText("タスク")
        
        print("ダイアログのOKを押す")
        let okButton = app.alerts.buttons["OK"]
        okButton.tap()
        
        print("タスクが追加されたか確認する")
        let addedTask = app.tables.cells.staticTexts["タスク"]
        XCTAssert(addedTask.exists)
    }
    
    func completeTask() {
        print("タスク一覧の1つ目をタップ")
        let firstCell = app.tables.cells.firstMatch
        firstCell.tap()
        
        print("Detail画面に遷移したことを確認")
        let detailNavigationBar = app.navigationBars["Detail"]
        XCTAssert(detailNavigationBar.exists)
        
        print("完了ボタンを押す")
        let completeButton = app.buttons["CompleteButton"]
        completeButton.tap()
        
        print("Tasks画面に戻ったことを確認")
        let mainNavigationBar = app.navigationBars["Tasks"]
        XCTAssert(mainNavigationBar.exists)

//        print("タスクが1件もない")
//        let noTask = app.tables.cells.count == 0
//        XCTAssert(noTask)
    }
}
