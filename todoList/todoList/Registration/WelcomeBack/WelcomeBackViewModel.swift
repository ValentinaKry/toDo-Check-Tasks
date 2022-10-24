import UIKit
import Combine

class WelcomeBackViewModel: ObservableObject {

    var signUpTapped = PassthroughSubject<Void, Never>()
    var signInTapped = PassthroughSubject<Void, Never>()
    var passwordTap = PassthroughSubject<Void, Never>()
    let networkManager = NetworkManager()
    @Published var email = ""
    @Published var password = ""

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
