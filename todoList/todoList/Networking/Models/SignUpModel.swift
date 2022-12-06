import Foundation

struct SignUpModel: Codable {
    struct Body: Codable {
        let email: String
        let password: String
        let username: String
    }
    
    struct SignUpResponse: Codable {
        let data: SignUpResponseData
    }
    
    struct UserSession: Codable {
        let accessToken: String?
        let tokenType: String?
        let refreshToken: String?
        let expiresIn: Int?
    }

    struct SignUpResponseData: Codable {
        let id: String?
        let email: String?
        let avatarUrl: String?
        let userSession: UserSession?
        let message: String?
        let code: Int?
    }
}
