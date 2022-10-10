
import UIKit
import Combine

final class ForgotPasswordViewModel: ObservableObject {
    let networkManager = NetworkingViewModel()
    @Published var email = ""
    @Published var password = ""
    var onTapSubject = PassthroughSubject<Void, Never>()
    func sendRequest () {
        onTapSubject.send()
    }
}
