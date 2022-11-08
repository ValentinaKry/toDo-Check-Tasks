import Foundation

struct SignInModel: Codable {
    struct Body: Codable {
        var username: String
        var password: String
    }
}
