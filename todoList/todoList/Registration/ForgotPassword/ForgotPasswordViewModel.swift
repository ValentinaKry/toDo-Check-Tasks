
import Foundation

final class ForgotPasswordViewModel: ObservableObject {
    var onTap : (() -> Void)?
    func sendRequest () {
        onTap?()
    }
}
