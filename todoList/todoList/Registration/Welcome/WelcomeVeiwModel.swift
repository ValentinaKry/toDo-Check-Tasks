
import Foundation

class WelcomeViewModel: ObservableObject {
    var onTap : (() -> Void)?
    var onTap2: (() -> Void)?

    func endTap () {
        onTap?()
    }

    func finTap () {
        onTap2?()
    }
}
