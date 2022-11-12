import SwiftUI
import Combine

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
//            .tryMap { data, response -> SignInModel.SignInResponse in
//
//                let decoder = JSONDecoder()
//
//                    // first try to decode `LoginResponse` from the data
//                if let loginResponse = try? decoder.decode(
//                    SignInModel.SignInResponse.self, from: data
//                ) {
//                    return loginResponse
//                }
//            }
            .decode(type: U.self, decoder: decoder)
            .mapError{ error -> NetworkRequestError in
                return NetworkRequestError.badRequest(message: error.localizedDescription)
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
            .mapError{ error -> NetworkRequestError in
                return NetworkRequestError.badRequest(message: error.localizedDescription)
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
            .mapError{ error -> NetworkRequestError in
                return NetworkRequestError.notFound
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
                return NetworkRequestError.badRequest (message: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}

extension NetworkManager {

    private func httpError(_ statusCode: Int) -> NetworkRequestError {
        switch statusCode {
        case 400: return .badRequest (message: "400")
        case 401: return .unauthorized (message: "Invalid credentials.")
        case 403: return .forbidden
        case 404: return .notFound
        case 402, 405...499: return .error4xx(statusCode, message: "❌")
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
