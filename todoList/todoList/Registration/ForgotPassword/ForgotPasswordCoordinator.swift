import UIKit
import SwiftUI
import Combine

final class ForgotPasswordCoordinator {
    let rootNavigation: UINavigationController
    var flowEnd = PassthroughSubject<Void, Never>()
    var cancellables = Set<AnyCancellable>()
    
    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let viewModel = ForgotPasswordViewModel()
        let view = UIHostingController(rootView: ForgotPassword(viewModel: viewModel))
        rootNavigation.pushViewController(view, animated: true)
        viewModel.onTapSubject
            .sink { self.flowEnd.send()}
            .store(in: &cancellables)
    }
}
