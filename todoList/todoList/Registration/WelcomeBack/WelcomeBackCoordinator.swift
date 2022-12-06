import UIKit
import SwiftUI
import Combine

final class WelcomeBackCoordinator {
    let rootNavigation: UINavigationController
    
    var flowEnd = PassthroughSubject<Void, Never>()
    var flowEnd2 = PassthroughSubject<Void, Never>()
    var flowEnd3 = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()

    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let viewModel = WelcomeBackViewModel()
        let view = UIHostingController(rootView: WelcomeBack(viewModel: viewModel))
        rootNavigation.pushViewController(view, animated: true)
        viewModel.signUpTapped
            .sink{ self.flowEnd.send()}
            .store(in: &cancellables)

        viewModel.passwordTap
            .sink{ self.flowEnd2.send()}
            .store(in: &cancellables)

        viewModel.signInTapped
            .sink{ self.flowEnd3.send()}
            .store(in: &cancellables)
    }
}
