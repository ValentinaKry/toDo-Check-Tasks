
import Foundation
import UIKit

class AppCoordinator {
    
    var window: UIWindow
    var navigationController = UINavigationController()
    var childsCoordinators = [Any]()

    init (window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
        window.rootViewController = navigationController
    }
    deinit {
        print(#function)
    }

    func start () {
        let flow1 = OnboardingCoordinator(rootNavigation: navigationController)
        flow1.start()
        childsCoordinators.append(flow1)
        flow1.flowEnd = {
            self.showRegistrationFlow()
        }
    }

    func showRegistrationFlow() {
        let flow2 = RegistrationCoordinator(rootNavigation: navigationController)
        flow2.start()
        childsCoordinators.append(flow2)
        flow2.endFlow = {
            self.gotoWorkList()
        }
        flow2.endSignIn = {
            self.gotoWorkList()
        }
        
    }

    func gotoWorkList () {
        let flow3 = TabbarCoordinator(rootNavigation: navigationController)
        flow3.start()
        childsCoordinators.append(flow3)
    }

}
