
import SwiftUI

class TaskViewModel: ObservableObject {
   @Published var items: [TaskModel] = [
    TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0 , isCompleted: true, isSwipped: false),
    TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
    TaskModel(task: "Read the book Zlatan", time: "12:30 am", offset: 0, isCompleted: false, isSwipped: false)
    ]

    func getSampleDate(offset: Int)-> Date {
        let calender = Calendar.current

        let date = calender.date(byAdding: .day, value: offset, to: Date())

        return date ?? Date()
    }
}
