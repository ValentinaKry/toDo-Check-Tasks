
import Foundation
import SwiftUI
import Combine

class OnboardingViewModel : ObservableObject{
    
    var onTapSubject = PassthroughSubject<Void, Never>()

    func endTap () {
        onTapSubject.send()
    }
}
