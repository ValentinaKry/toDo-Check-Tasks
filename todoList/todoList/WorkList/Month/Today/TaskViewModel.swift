
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var items: [TaskModel] = [
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0 , isCompleted: true, isSwipped: false, taskDate: .now),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false, taskDate: .now),
        TaskModel(task: "Read the book Zlatan", time: "12:30 am", offset: 0, isCompleted: false, isSwipped: false, taskDate: .now)
    ]
//item c объектом
        //    func getSampleDate(offset: Int)-> Date {
        //        let calender = Calendar.current
        //
        //        let date = calender.date(byAdding: .day, value: offset, to: Date())
        //
        //        return date ?? Date()
        //    }

        //MARK: Current Week Days
    @Published var currentWeek: [Date] = []

        // MARK: Current Day
    @Published var currentDay: Date = Date()

        //MARK: Filtering Today Tasks
    @Published var filteredTasks: [Task]?

        //MARK: Intializing
    init() {
        fetchCurrentWeek()
       // filterTodayTasks()
    }

        //MARK: Filter Today Tasks
//    func filterTodayTasks() {
//
//        DispatchQueue.global(qos: .userInteractive).async {
//
//            let calendar = Calendar.current
//            let filtered = self.items.filter {
//                return calendar.isDate($0.taskDate, inSameDayAs: self.currentDay)
//            }
//                .sorted { task1, task2 in
//                    return task2.taskDate < task1.taskDate
//                }
//
//            DispatchQueue.main.async {
//                withAnimation {
//                    self.filteredTasks = filtered
//                }
//            }
//        }
//    }

    func fetchCurrentWeek() {

        let today = Date()
        let calendar = Calendar.current

        let week = calendar.dateInterval(of: .weekOfMonth, for: today)

        guard  let firstWeekDay = week?.start else {
            return
        }

        (1...7).forEach { day in

            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }

        // MARK: Extracting Date

    func extractDate (date: Date, format: String) -> String {
        let formatter = DateFormatter()

        formatter.dateFormat = format

        return formatter.string(from: date)
    }

        // MARK: Checking if current Date is Today
    func isToday(date: Date) -> Bool {

        let calendar = Calendar.current

        return calendar.isDate(currentDay, inSameDayAs: date)
    }

        // MARK: Checking if the current Hour is task Hour

    func isCurrentHour(date: Date)->Bool {
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: date)
        let currentHour = calendar.component(.hour, from: Date())

        return hour == currentHour
    }
}
