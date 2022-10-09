import UIKit
import SwiftUI
final class WelcomeCoordinator {
    let rootNavigation: UINavigationController
    var endFlow: (() -> Void)?
    var endFlow2: (() -> Void)?

    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let viewModel = WelcomeViewModel()
        let view = UIHostingController(rootView: Welcome(viewModel: viewModel))
        rootNavigation.pushViewController(view, animated: true)
        viewModel.onTap = {
            self.endFlow?()
        }
        viewModel.onTap2 = {
            self.endFlow2?()
        }
    }

}
