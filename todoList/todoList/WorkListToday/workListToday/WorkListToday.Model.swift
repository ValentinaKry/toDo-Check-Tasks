
import Foundation

struct WorkListTodayModel : Hashable, Codable, Identifiable {
    var id: Int
    var text: String
    var isComleted: Bool
}
