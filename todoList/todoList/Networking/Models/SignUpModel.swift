import Foundation

struct Body: Codable {
    let email: String
    let password: String
    let username: String
}

struct Response: Codable {
    let id: String
    let email: String
    let avatarUrl: Bool
    let userSession: UserSession
}

struct UserSession: Codable {
    let accessToken: String?
    let tokenType: String?
    let refreshToken: String?
    let expiresIn: Int?
}

