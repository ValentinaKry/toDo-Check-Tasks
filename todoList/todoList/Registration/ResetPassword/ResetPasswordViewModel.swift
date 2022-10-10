
import UIKit
import Combine

final class ResetPasswordViewModel: ObservableObject {
    let networkManager = NetworkingViewModel()
    @Published var email = ""
    @Published var password = ""
    var resetTaped = PassthroughSubject<Void, Never>()
    func endTap () {
        resetTaped.send()
    }
}
