import Foundation

struct Body: Codable {
    let email: String
    let password: String
    let username: String
}

struct Response: Codable {
    let data: Data
}
//Модель взять и написать
struct Data: Codable {
    let access_token: String?
    let token_type: String?
    let refresh_token: String?
    let expires_in: Int?
}
