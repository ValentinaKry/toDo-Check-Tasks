
import UIKit
import Combine

class WelcomeBackViewModel: ObservableObject {

    var signUpTapped = PassthroughSubject<Void, Never>()
    var signInTaped = PassthroughSubject<Void, Never>()
    var passwordTap = PassthroughSubject<Void, Never>()

    func signUpTap () {
        signUpTapped.send()
    }

    func signInTap () {
        signInTaped.send()
    }

    func forgotPassword () {
        passwordTap.send()
    }
}
