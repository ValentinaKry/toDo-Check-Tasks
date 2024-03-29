
import SwiftUI

struct TaskModel : Identifiable, Codable {
    var id = UUID().uuidString
    var task: String
    var time: String
    var offset: CGFloat
    var isCompleted: Bool
    var isSwipped: Bool
    var taskDate: Date
}
