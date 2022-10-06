import SwiftUI

struct Task: Identifiable {
    var id = UUID().uuidString
    var title : String
    var offset: CGFloat
    var isCompleted: Bool
    var isSwipped: Bool
    var time: Date = Date()
}

struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

func getSampleDate(offset: Int)-> Date {
    let calender = Calendar.current

    let date = calender.date(byAdding: .day, value: offset, to: Date())

    return date ?? Date()
}

var tasks : [TaskMetaData] = [
    TaskMetaData(task: [
        Task(title: "Talk to iJustine", offset: 0 , isCompleted: true, isSwipped: false),
        Task(title: "iPhome 13 Great Design Change😂" , offset: 0 , isCompleted: true, isSwipped: false),
        Task(title: "Nothing Much Workout !!!" , offset: 0 , isCompleted: true, isSwipped: false)
    ], taskDate: getSampleDate(offset: 1)),

    TaskMetaData(task: [
        Task(title: "Talk to Jenna Ezarik", offset: 0 , isCompleted: true, isSwipped: false)
    ], taskDate: getSampleDate(offset: -3)),

    TaskMetaData(task: [
        Task(title: "Metting with Tim Cook", offset: 0 , isCompleted: true, isSwipped: false)
    ], taskDate: getSampleDate(offset: -8)),

    TaskMetaData (task: [
        Task(title: "Next Version of SwiftUI", offset: 0 , isCompleted: true, isSwipped: false)
    ], taskDate: getSampleDate(offset: 10)),

    TaskMetaData(task: [
        Task(title: "Nothing Much Workout !!!", offset: 0 , isCompleted: true, isSwipped: false)
    ], taskDate: getSampleDate(offset: -22)),

    TaskMetaData(task: [
        Task(title: "iPhome 13 Great Design Change😂", offset: 0 , isCompleted: true, isSwipped: false)
    ], taskDate: getSampleDate(offset: 15)),

    TaskMetaData(task: [
        Task(title: "Kavsoft App Updates ....", offset: 0 , isCompleted: true, isSwipped: false)
    ], taskDate: getSampleDate(offset: -20))
]
