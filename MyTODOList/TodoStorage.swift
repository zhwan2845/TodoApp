import Foundation
import SQLite // 데이터베이스

@Observable
class TodoStorage {
    var todoList: [Todo] = []
    var db: Connection?
    var table: Table
    var idCol: Expression<Int64>
    var startDateCol: Expression<Date>
    var endDateCol: Expression<Date?>
    var contentCol: Expression<String>
    var doneCol: Expression<Bool>
    
    init() {
        self.db = try? Connection("todoList.sqlite3")
        self.table = Table("todo list")
        self.idCol = Expression<Int64>("id")
        self.startDateCol = Expression<Date>("start date")
        self.endDateCol = Expression<Date?>("end date")
        self.contentCol = Expression<String>("content")
        self.doneCol = Expression<Bool>("done")

        _ = try? self.db?.run(self.table.create { t in
            t.column(self.idCol, primaryKey: .autoincrement)
            t.column(self.startDateCol)
            t.column(self.endDateCol)
            t.column(self.contentCol)
            t.column(self.doneCol)
        })
        fetchTodoList()
    }
    
    func fetchTodoList() {
        let items = try? db?.prepare(table)
        todoList = items?.map { item in
            Todo(id: item[idCol],
                 startDate: item[startDateCol],
                 endDate: item[endDateCol],
                 content: item[contentCol],
                 done: item[doneCol])
        } ?? []
    }
    
    func insert(_ content: String) {
        let query = table.insert(startDateCol <- Date(),
                                 endDateCol <- nil,
                                 contentCol <- content,
                                 doneCol <- false)
        _ = try? db?.run(query)
        fetchTodoList()
    }
    
    func updateDoneField(id: Int64, done: Bool) {
        let item = table.filter(idCol == id)
        var query: Update
        if done {
            query = item.update(doneCol <- done,
                                endDateCol <- Date())
        } else {
            query = item.update(doneCol <- done,
                                endDateCol <- nil)
        }
        _ = try? db?.run(query)
        fetchTodoList()
    }
    
    func updateStartDateField(id: Int64, start: Date) {
        let item = table.filter(idCol == id)
        let query = item.update(startDateCol <- start)
        _ = try? db?.run(query)
        fetchTodoList()
    }
    
    func updateContentField(id: Int64, content: String) {
        let item = table.filter(idCol == id)
        let query = item.update(contentCol <- content)
        _ = try? db?.run(query)
        fetchTodoList()
    }
    
    func delete(id: Int64) {
        let item = table.filter(idCol == id)
        let query = item.delete()
        _ = try? db?.run(query)
        fetchTodoList()
    }
}
