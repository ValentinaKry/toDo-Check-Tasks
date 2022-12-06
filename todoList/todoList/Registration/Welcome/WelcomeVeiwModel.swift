import UIKit
import Combine

class WelcomeViewModel: ObservableObject {
    var networkManager = NetworkManager()

    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var appError : String? = nil
    @Published var isShowError: Bool = false
    var model: SignUpModel.Body {
        SignUpModel.Body(email: email, password: password, username: username)
    }
    var signUpResponse: AnyPublisher<SignUpModel.SignUpResponse, NetworkRequestError> {
        networkManager.post(body: model, path: Path.signUp.rawValue, header: nil)
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
                    self.appError = error.errorDescription
                    self.isShowError = true
                }
            } receiveValue: { item in
                print(item)
            }
            .store(in: &cancellables)
    }
}
