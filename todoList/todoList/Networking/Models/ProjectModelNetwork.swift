import Foundation

struct ProjectResponseModel: Codable {
    let data: ProjectResponseData
}

struct ProjectResponseData: Codable {
    let id: String
    let title: String
    let color: String
    let ownerId: String
    let createdAt: String
}
