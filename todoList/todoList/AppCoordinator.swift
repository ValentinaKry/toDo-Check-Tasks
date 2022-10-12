import UIKit
import Combine

class AppCoordinator {
    
    var window: UIWindow
    var navigationController = UINavigationController()
    var childsCoordinators = [Any]()
    var cancellables = Set<AnyCancellable>()
    init (window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
        window.rootViewController = navigationController
    }

    func start () {

        if UserDefaults.standard.bool(forKey: "didSee")  {
            UserDefaults.standard.set(false, forKey: "didSee")
            showRegistrationFlow()
        } else {
            UserDefaults.standard.set(true, forKey: "didSee")
            showOnboarding()

        }
    }
    func showOnboarding () {
        let flow1 = OnboardingCoordinator(rootNavigation: navigationController)
        flow1.start()
        childsCoordinators.append(flow1)
        flow1.flowEnd
            .sink{
            self.showRegistrationFlow()
            }.store(in: &cancellables)
    }

    func showRegistrationFlow() {
        let flow2 = RegistrationCoordinator(rootNavigation: navigationController)
        flow2.start()
        childsCoordinators.append(flow2)
        flow2.endFlow
            .sink{self.gotoWorkList()}
            .store(in: &cancellables)
        flow2.endSignIn
            .sink{self.gotoWorkList()}
            .store(in: &cancellables)
        
    }

    func gotoWorkList () {
        let flow3 = TabbarCoordinator(rootNavigation: navigationController)
        flow3.start()
        childsCoordinators.append(flow3)
    }

}
