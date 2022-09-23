
import Foundation
import UIKit
import SwiftUI

final class ForgotPasswordCoordinator {
    let rootNavigation: UINavigationController
    var flowEnd: (() -> Void)?

    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let viewModel = ForgotPasswordViewModel()
        let view = UIHostingController(rootView: ForgotPassword(viewModel: viewModel))
        rootNavigation.pushViewController(view, animated: true)
    }
}
