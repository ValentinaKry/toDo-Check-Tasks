import Foundation

enum NetworkRequestError: LocalizedError, Equatable {
    case invalidRequest
    case badRequest (message: String )
    case unauthorized (message: String)
    case forbidden
    case notFound
    case error4xx(_ code: Int, message: String)
    case serverError
    case error5xx(_ code: Int)
    case decodingError
    case urlSessionFailed(_ error: URLError)
    case unknownError

    var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return NSLocalizedString("😭 invalid Request", comment: "")
        case .badRequest(message: _):
            return NSLocalizedString("404 problem with your request", comment: "")
        case .unauthorized(message: _):
            return NSLocalizedString("Could not Authorization", comment: "")
        case .forbidden:
            return NSLocalizedString("401 Forbidden, download your app again", comment: "")
        case .notFound:
            return NSLocalizedString("Not found that user", comment: "")
        case .error4xx(_, message: _):
            return NSLocalizedString("Failed 😭😭😭, try again", comment: "")
        case .serverError:
            return NSLocalizedString("500. Problem with server, please try again", comment: "")
        case .error5xx(_):
            return NSLocalizedString("Please try again", comment: "")
        case .decodingError:
            return NSLocalizedString("There was problem loading your ToDoList app.", comment: "")
        case .urlSessionFailed(_):
            return NSLocalizedString("The problem with URLSession, please check your internet", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown Error", comment: "")
        }
    }
}

struct ErrorType: Identifiable {
    let id = UUID()
    let error: NetworkRequestError
}
