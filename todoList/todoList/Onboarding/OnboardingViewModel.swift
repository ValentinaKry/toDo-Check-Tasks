
import Foundation
import SwiftUI
import Combine

class OnboardingViewModel : ObservableObject{
    
    var onTapSubject = PassthroughSubject<Void, Never>()
    var done = UserDefaults.standard.bool(forKey: "didSee")

    func endTap () {
        onTapSubject.send()
        UserDefaults.standard.set(self.done, forKey: "didSee")
        
    }
}
