import UIKit
import Combine

class WelcomeBackViewModel: ObservableObject {

    var signUpTapped = PassthroughSubject<Void, Never>()
    var signInTapped = PassthroughSubject<Void, Never>()
    var passwordTap = PassthroughSubject<Void, Never>()
    let networkManager = NetworkManager()
    @Published var email = ""
    @Published var password = ""
    @Published var appError: String? = nil
    @Published var isSgowError: Bool = false
    private var cancellables = Set<AnyCancellable>()

    var model: SignInModel.Body {
        SignInModel.Body(email: email, password: password)
    }
    var signInResponse: AnyPublisher<SignInModel.SignInResponse, NetworkRequestError> {
        networkManager.post(body: model , path: Path.signIn.rawValue, header: nil)
    }

    func signUpTap () {
        signUpTapped.send()
    }

    func signInTap () {
        signInTapped.send()
        signInResponse
            .sink { item in
                switch item {
                case .finished:
                    return
                case .failure(let error):
                    self.appError = error.errorDescription
                    self.isSgowError = true
                }
            } receiveValue: { item in
                print(item)
            }
            .store(in: &cancellables)
    }

    func forgotPassword () {
        passwordTap.send()
    }
}
