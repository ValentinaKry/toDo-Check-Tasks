import UIKit
import SwiftUI
final class OnboardingCoordinator {
    let rootNavigation: UINavigationController
    var flowEnd: (() -> Void)?

    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let viewModel = OnboardingViewModel()
        let view = UIHostingController(rootView: OnboardingView(model: viewModel))
        viewModel.onTap = {
            self.flowEnd?()
        }
        rootNavigation.pushViewController(view, animated: false)
    }
}
