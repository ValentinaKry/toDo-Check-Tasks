import Foundation

//MARK: Path
enum Path: String {
    case signIn = "/sign-in"
    case signUp = "/sign-up"
    case refreshToken = "/refresh-token"
    case projects = "/projects"
    case fetchProjects = "/user-projects/"
    case note = "/notes"
    case fetchNotes = "user-notes"
    case fetchUser = "/users/"
    case fetchUserStatistics = "/users-statistics/"
    case userAvatar = "/users-avatar"
    case checklists = "/cheklists"
    case shecklistsItems = "/checklists-items"
    case userChecklists = "/user-checklists/"
}

//MARK: Endpoint
enum BaseURL: String {
    case authorization = "https://todolist.dev2.cogniteq.com/api/v1"
}

//MARK: Method

enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
