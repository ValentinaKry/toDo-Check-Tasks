
import Foundation

class WelcomeViewModel: ObservableObject {
    let networkManager = NetworkingViewModel()
    @Published var email = ""
    @Published var password = ""
    var model: Body {
        Body(email: email, password: password)
    }

    var onTap : (() -> Void)?
    var onTap2: (() -> Void)?
    init() {

    }

    func endTap () {
        onTap?()

    }

    func finTap () {
        onTap2?()
        networkManager.postData(body: model)
    }
}
