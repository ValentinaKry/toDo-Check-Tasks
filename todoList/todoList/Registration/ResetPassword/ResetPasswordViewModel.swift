
import UIKit
import Combine

final class ResetPasswordViewModel: ObservableObject {
    let networkManager = NetworkManager()
    @Published var email = ""
    @Published var password = ""
    var resetTaped = PassthroughSubject<Void, Never>()
    func endTap () {
        resetTaped.send()
    }
}
