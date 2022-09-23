
import Foundation

struct OnboardingModel:Identifiable {
    var id = UUID().uuidString
    let imageName: String
    let title: String
    let description: String
}

 let screens: [OnboardingModel] = [
    OnboardingModel(imageName: "Screen1",
                title: "Welcom to todo list",
                description: "Whats going to happen tomarrow?"),

    OnboardingModel(imageName: "Screen2",
                title: "Work happens",
                description: "Get notified when work happens."),

    OnboardingModel(imageName: "Screen3",
                title: "Tasks and assign",
                description: "Task and assign them to colleagues.")
]
