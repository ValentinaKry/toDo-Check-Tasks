
import Foundation

class WelcomeBackViewModel: ObservableObject {
    var signUpTapped : (() -> Void)?
    var signInTaped:  (() -> Void)?
    var passwordTap: (() -> Void)?

    func signUpTap () {
        signUpTapped?()
    }

    func signInTap () {
        signInTaped?()
    }

    func forgotPassword () {
        passwordTap?()
    }
}
