
import Foundation

class OnboardingViewModel : ObservableObject{

    var onTap : (() -> Void)?

    func endTap () {
        onTap?()
    }
}
