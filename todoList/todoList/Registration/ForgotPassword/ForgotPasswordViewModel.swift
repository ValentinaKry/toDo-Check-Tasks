
import UIKit
import Combine

final class ForgotPasswordViewModel: ObservableObject {
    var onTapSubject = PassthroughSubject<Void, Never>()
    func sendRequest () {
        onTapSubject.send()
    }
}
