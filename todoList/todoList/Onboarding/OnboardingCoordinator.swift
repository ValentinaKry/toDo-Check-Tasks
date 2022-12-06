import UIKit
import SwiftUI
import Combine

final class OnboardingCoordinator {
    let rootNavigation: UINavigationController
    var flowEnd = PassthroughSubject<Void, Never>()
    var cancellables = Set<AnyCancellable>()
    var hasSeenOnboarding =  CurrentValueSubject<Bool, Never>(true)

    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let viewModel = OnboardingViewModel()
        let view = OnboardingView(model: viewModel) { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }

        let view2 = UIHostingController(rootView: view)

        viewModel.onTapSubject
            .sink { self.flowEnd.send() }
        .store(in: &cancellables)

        rootNavigation.pushViewController(view2, animated: false)
    }
}
