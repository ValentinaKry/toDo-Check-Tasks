import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in

            let size = proxy.size
            Walkthrough(screenSize: size)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
