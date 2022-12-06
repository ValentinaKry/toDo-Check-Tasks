
import UIKit
import Combine
import SwiftUI

class NavbarViewModel: ObservableObject {
    var tappedToday = PassthroughSubject<Void, Never>()
    var tapppedMonth = PassthroughSubject<Void, Never>()
    @Published var showingFavs = false

    func todayTap() {
        tappedToday.send()
    }

    func monthTap() {
        tapppedMonth.send()
    }

    func sortFavs() {
        withAnimation {
            showingFavs.toggle()
        }
    }
}
