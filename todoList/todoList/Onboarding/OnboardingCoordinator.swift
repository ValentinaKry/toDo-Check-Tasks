import UIKit
import SwiftUI
import Combine
final class OnboardingCoordinator {
    let rootNavigation: UINavigationController
    var flowEnd: (() -> Void)?
    var cancellables = Set<AnyCancellable>()

    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let viewModel = OnboardingViewModel()
        let view = UIHostingController(rootView: OnboardingView(model: viewModel))
        viewModel.onTapSubject
            .sink { self.flowEnd?() }
        .store(in: &cancellables)

        rootNavigation.pushViewController(view, animated: false)
    }
}
