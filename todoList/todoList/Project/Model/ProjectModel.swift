import Foundation

enum ProjectColor: String, CaseIterable, Identifiable {
    var id: String{self.rawValue}
    case blue = "Blue"
    case pink = "Pink"
    case green = "Green"
    case ink = "Ink"
    case yellow = "Yellow"
}

struct ProjectModel: Identifiable {
    var id = UUID()
    var title: String
    var color: ProjectColor.RawValue
    var intItems: Int
}

var projectList = [ProjectModel(title: "Personal", color: "Blue", intItems: 10),
                   ProjectModel(title: "Teamworks", color: "Pink", intItems: 5),
                   ProjectModel(title: "Home", color: "Green", intItems: 1),
                   ProjectModel(title: "Meet", color: "Purple", intItems: 7)

]

extension ProjectModel {
    static let all: [ProjectModel] = [
        ProjectModel(title: "Personal", color: "Blue", intItems: 10),
        ProjectModel(title: "Teamworks", color: "Pink", intItems: 5),
        ProjectModel(title: "Home", color: "Green", intItems: 8),
        ProjectModel(title: "Meet", color: "Purple", intItems: 7)
    ]
}


