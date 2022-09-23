
import Foundation
import UIKit
import SwiftUI

final class TabbarCoordinator {
    let rootNavigation: UINavigationController
    var flowEnd: (() -> Void)?

    init(rootNavigation: UINavigationController) {
        self.rootNavigation = rootNavigation
    }

    func start () {
        let view = UIHostingController (rootView: Tabbar())
        rootNavigation.pushViewController(view, animated: true)
    }
}
