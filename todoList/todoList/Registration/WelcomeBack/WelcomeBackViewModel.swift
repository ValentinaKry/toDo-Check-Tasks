import UIKit
import Combine

class WelcomeBackViewModel: ObservableObject {

    var signUpTapped = PassthroughSubject<Void, Never>()
    var signInTapped = PassthroughSubject<Void, Never>()
    var passwordTap = PassthroughSubject<Void, Never>()
    let networkManager = NetworkManager()
    @Published var email = ""
    @Published var password = ""
   // var model:
//    var signUpResponse: AnyPublisher<_, NetworkRequestError> {
//        networkManager.post(body: model , path: Path.signIn.rawValue, header: nil)
//    }

    func signUpTap () {
        signUpTapped.send()
    }

    func signInTap () {
        signInTapped.send()
    }

    func forgotPassword () {
        passwordTap.send()
    }
}
