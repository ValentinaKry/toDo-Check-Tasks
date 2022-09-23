
import Foundation

final class ResetPasswordViewModel: ObservableObject {
    var resetTaped: (() -> Void)?
    func endTap () {
        resetTaped?()
    }
}
