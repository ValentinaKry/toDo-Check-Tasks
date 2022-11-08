import UIKit
import Combine

class WelcomeViewModel: ObservableObject {
    var networkManager = NetworkManager()

    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var appError : ErrorType? = nil
    var model: SignUpModel.Body {
        SignUpModel.Body(email: email, password: password, username: username)
    }
    var signUpResponse: AnyPublisher<SignUpModel.Response, NetworkRequestError> {
        networkManager.post(body: model, path: Path.signIn.rawValue, header: nil)
    }

    private var cancellables = Set<AnyCancellable>()

    var onTap = PassthroughSubject<Void, Never>()
    var onTap2 = PassthroughSubject<Void, Never>()

    func endTap () {
        onTap.send()
    }

    func finTap () {
        onTap2.send()
        signUpResponse
            .sink { item in
                switch item {
                case .finished:
                    return
                case .failure(let error):
                    self.appError = ErrorType(error: .unauthorized(message:  "❌"))
                    print(NetworkRequestError.unauthorized(message: "❌").localizedDescription)
                }
            } receiveValue: { item in
                print(item)
            }
            .store(in: &cancellables)
    }
}
