import UIKit
import Combine

class WelcomeViewModel: ObservableObject {
    let networkManager = NetworkingViewModel()
    @Published var email = ""
    @Published var password = ""
        // private var cancellables = Set<AnyCancellable>()
    var model: Body {
        Body(email: email, password: password)
    }

    var onTap = PassthroughSubject<Void, Never>()
    var onTap2 = PassthroughSubject<Void, Never>()

    func endTap () {
        onTap.send()
    }

    func finTap () {
        onTap2.send()
        networkManager.postData(body: model)
    }
}
