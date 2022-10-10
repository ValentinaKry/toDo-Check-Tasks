import UIKit
import Combine

class AppCoordinator {
    
    var window: UIWindow
    var navigationController = UINavigationController()
    var childsCoordinators = [Any]()
    var cancellables = Set<AnyCancellable>()
    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)

    init (window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
        window.rootViewController = navigationController
    }

    func start () {
        setupOnboardingValue()
        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
                if hasSeen {
                    self?.showRegistrationFlow()
                } else {
                    self?.showOnboarding()
                }
            }
            .store(in: &cancellables)
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


    func setupOnboardingValue() {

        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key)
        hasSeenOnboarding.send(value)

        hasSeenOnboarding
            .filter({ $0 })
            .sink { (value) in
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &cancellables)
    }

}
