
import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let quistion: String
    let footerBg: String
}

var onBoardingSteps = [
    OnBoardingStep(image: "undrawEvents", title: "Welcome to todo list", quistion: "Whats going to happend tomorrow?", footerBg: "redWave"),
    OnBoardingStep(image: "undrawSuperhero", title: "Work happens", quistion: "Get notifed when work happens.", footerBg: "blueWave"),
    OnBoardingStep(image: "undrawAnalysis", title: "Tasks and assign", quistion: "Task and assing them to colleagues.", footerBg: "purpleWave")

]
