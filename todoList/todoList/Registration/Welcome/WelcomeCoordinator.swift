import UIKit
import SwiftUI
import Combine

final class WelcomeCoordinator {
    let rootNavigation: UINavigationController
    private var cancellables = Set<AnyCancellable>()
    var endFlow = PassthroughSubject<Void, Never>()
    var endFlow2 = PassthroughSubject<Void, Never>()

    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let viewModel = WelcomeViewModel()
        let view = UIHostingController(rootView: Welcome(viewModel: viewModel))
        rootNavigation.pushViewController(view, animated: true)
        viewModel.onTap
            .sink{self.endFlow.send()}
            .store(in: &cancellables)
        viewModel.onTap2
            .sink{self.endFlow2.send()}
            .store(in: &cancellables)
    }
}
