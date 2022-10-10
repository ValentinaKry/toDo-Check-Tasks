import UIKit
import Combine

final class RegistrationCoordinator {
    let rootNavigation: UINavigationController
    private var cancellables = Set<AnyCancellable>()
    var endFlow  = PassthroughSubject<Void, Never>()
    var endSignIn  = PassthroughSubject<Void, Never>()

    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let flow1 = WelcomeCoordinator(rootNavigation: rootNavigation)
        flow1.start()
        flow1.endFlow
            .sink{self.goToSignIn()}
            .store(in: &cancellables)
        flow1.endFlow2
            .sink{self.endFlow.send()}
            .store(in: &cancellables)
    }

    func goToSignIn () {
        let flow2 = WelcomeBackCoordinator(rootNavigation: rootNavigation)
        flow2.start()
        flow2.flowEnd
            .sink{ self.start()}
            .store(in: &cancellables)
        flow2.flowEnd2
            .sink{ self.goToPassword()}
            .store(in: &cancellables)
        flow2.flowEnd3
            .sink{self.endSignIn.send()}
            .store(in: &cancellables)
    }

    func goToPassword () {
        let flow3 = ForgotPasswordCoordinator(rootNavigation: rootNavigation)
        flow3.start()
    }
}
