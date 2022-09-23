import UIKit
import SwiftUI
final class RegistrationCoordinator {
    let rootNavigation: UINavigationController
    var endFlow: (() -> Void)?
    var endSignIn: (() -> Void)?

    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let flow1 = WelcomeCoordinator(rootNavigation: rootNavigation)
        flow1.start()
        flow1.endFlow = {
            self.goToSignIn()
        }
        flow1.endFlow2 = {
            self.endFlow?()
        }
    }

    func goToSignIn () {
        let flow2 = WelcomeBackCoordinator(rootNavigation: rootNavigation)
        flow2.start()
        flow2.flowEnd = {
            self.start()
        }
        flow2.flowEnd2 = {
            self.goToPassword()
        }
        flow2.flowEnd3 = {
            self.endSignIn?()
        }
    }

    func goToPassword () {
        let flow3 = ForgotPasswordCoordinator(rootNavigation: rootNavigation)
        flow3.start()
    }


}
