import SwiftUI


struct Intro: Identifiable {
    var id = UUID().uuidString
    let image: String
    let title: String
    let question: String
    let color : Color
}

var intros: [Intro] =  [
    Intro(image: "screen1", title: "Welcome to todo list", question: "Whats going to happend tomorrow?", color: Color.init("screen1")),
    Intro(image: "screen2", title: "Work happens", question: "Get notifed when work happens.", color: Color.init("screen2")),
    Intro(image: "screen3", title: "Tasks and assign", question: "Task and assing them to colleagues.", color: Color.init("screen3"))]

