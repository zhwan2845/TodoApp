import Foundation

@Observable
class Todo: Hashable, Equatable {
    var id: Int64
    var startDate: Date
    var endDate: Date?
    var content: String
    var done: Bool

    init(id: Int64, startDate: Date, endDate: Date?, content: String, done: Bool) {
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.content = content
        self.done = done
    }

    static func == (lhs: Todo, rhs: Todo) -> Bool {
        if lhs.id == rhs.id {
            return true
        }
        return false
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
