
import Foundation
import UIKit
import SwiftUI
final class WelcomeBackCoordinator {
    let rootNavigation: UINavigationController
    var flowEnd: (() -> Void)?
    var flowEnd2: (() -> Void)?
    var flowEnd3: (() -> Void)?

    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let viewModel = WelcomeBackViewModel()
        let view = UIHostingController(rootView: WelcomeBack(viewModel: viewModel))
        rootNavigation.pushViewController(view, animated: true)
        viewModel.signUpTapped = {
            self.flowEnd?()
        }

        viewModel.passwordTap = {
            self.flowEnd2?()
        }

        viewModel.signInTaped = {
            self.flowEnd3?()
        }
    }
}
