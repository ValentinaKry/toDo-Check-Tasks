import Foundation


class ProjectViewModel: ObservableObject {
    @Published private(set) var projects: [ProjectModel] = []

    init () {
        projects = ProjectModel.all
    }

    func addProject(project: ProjectModel) {
        projects.append(project)
    }
}
