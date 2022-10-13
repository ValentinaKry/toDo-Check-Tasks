
import UIKit
import Combine

class NavbarViewModel: ObservableObject {
    var tappedToday = PassthroughSubject<Void, Never>()
    var tapppedMonth = PassthroughSubject<Void, Never>()

    func todayTap() {
        tappedToday.send()
    }

    func monthTap() {
        tapppedMonth.send()
    }
}
