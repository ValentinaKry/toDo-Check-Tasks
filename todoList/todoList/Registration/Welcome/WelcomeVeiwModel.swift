import UIKit
import Combine

class WelcomeViewModel: ObservableObject {
    var networkManager = NetworkManager()

    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    var model: Body {
        Body(email: email, password: password, username: username)
    }
    var signUpResponse: AnyPublisher<Response, NetworkRequestError> {
        networkManager.post(body: model , path: Path.signIn.rawValue, header: nil)
    }

    private var cancellables = Set<AnyCancellable>()

    var onTap = PassthroughSubject<Void, Never>()
    var onTap2 = PassthroughSubject<Void, Never>()

    func endTap () {
        onTap.send()
    }

    func finTap () {
        onTap2.send()
        signUpResponse
            .sink { item in
                switch item {
                case .finished:
                    return
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { item in
                print(item)
            }
            .store(in: &cancellables)
    }
}
