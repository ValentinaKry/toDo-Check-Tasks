import SwiftUI
import Combine

enum NetworkRequestError: LocalizedError, Equatable {
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError
    case urlSessionFailed(_ error: URLError)
    case unknownError
}

class NetworkManager: ObservableObject {

    static let shared = NetworkManager()
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    let session = URLSession.shared

    func post<T, U>(body: T, path: String, header: String?) -> AnyPublisher<U, NetworkRequestError> where T : Encodable, U : Decodable {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.outputFormatting = .prettyPrinted

        let jsonData = try? encoder.encode(body)

        let url = URL(string: BaseURL.authorization.rawValue + path)
        var request = URLRequest(url: url!)
        request.httpMethod = Method.post.rawValue
        request.httpBody = jsonData
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if header != nil {
            request.setValue(header, forHTTPHeaderField: "Authorization")
        }

        return session.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map{ $0.data }
            .decode(type: U.self, decoder: decoder)
            .mapError{ error -> NetworkRequestError in
                return NetworkRequestError.badRequest
            }
            .eraseToAnyPublisher()
    }

    func get<U>(path: String, header: String?)  -> AnyPublisher<U, NetworkRequestError> where U : Decodable {
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let url = URL(string: BaseURL.authorization.rawValue + path)
        var request = URLRequest(url: url!)
        request.httpMethod = Method.get.rawValue

        if header != nil {
            request.setValue(header, forHTTPHeaderField: "Authorization")
        }

        return session.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map{ $0.data }
            .decode(type: U.self, decoder: decoder)
            .mapError{ error in
                self.handleError(error)
            }
            .eraseToAnyPublisher()
    }

    func delete<U> (path: String, header: String?) -> AnyPublisher<U, NetworkRequestError> where U : Decodable {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let url = URL(string: BaseURL.authorization.rawValue + path)
        var request = URLRequest(url: url!)

        request.httpMethod = Method.delete.rawValue

        if header != nil {
            request.setValue(header, forHTTPHeaderField: "Authorization")
        }

        return session.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map{ $0.data }
            .decode(type: U.self, decoder: decoder)
            .mapError{ error in
                self.handleError(error)
            }
            .eraseToAnyPublisher()

    }

    func put <T, U>(body: T, path: String, header: String?) -> AnyPublisher<U, NetworkRequestError> where T : Encodable, U : Decodable {

        decoder.keyDecodingStrategy = .convertFromSnakeCase
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.outputFormatting = .prettyPrinted

        let jsonData = try? encoder.encode(body)

        let url = URL(string: BaseURL.authorization.rawValue + path)
        var request = URLRequest(url: url!)
        request.httpMethod = Method.put.rawValue
        request.httpBody = jsonData
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if header != nil {
            request.setValue(header, forHTTPHeaderField: "Authorization")
        }

        return session.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map{ $0.data }
            .decode(type: U.self, decoder: decoder)
            .mapError{ error -> NetworkRequestError in
                return NetworkRequestError.badRequest
            }
            .eraseToAnyPublisher()
    }
}

extension NetworkManager {

    private func httpError(_ statusCode: Int) -> NetworkRequestError {
        switch statusCode {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 402, 405...499: return .error4xx(statusCode)
        case 500: return .serverError
        case 501...599: return .error5xx(statusCode)
        default: return .unknownError
        }
    }

    private func handleError(_ error: Error) -> NetworkRequestError {
        switch error {
        case is Swift.DecodingError:
            return .decodingError
        case let urlError as URLError:
            return .urlSessionFailed(urlError)
        case let error as NetworkRequestError:
            return error
        default:
            return .unknownError
        }
    }
}
