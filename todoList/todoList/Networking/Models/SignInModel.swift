import Foundation

struct SignInModel: Codable {
    struct Body: Codable {
        var email: String
        var password: String
    }

    struct SignInResponse: Codable {
        let data: SignInResponseData
    }

    struct SignInResponseData: Codable {
        let accessToken: String?
        let tokenType: String?
        let refreshToken: String?
        let expiresIn: Int?
        let message: String?
        let code: Int?
    }
    
}
