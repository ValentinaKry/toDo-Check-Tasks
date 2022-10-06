
import SwiftUI

struct WorkListMonth_View: View {
    @State var currentDate: Date = Date()
    var body: some View {
        VStack {
            NavBar()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    CustomDatePicker(currentDate: $currentDate)
                }
                .padding(.vertical)
            }

            Tabbar()
        }
    }
}

struct WorkListMonth_View_Previews: PreviewProvider {
    static var previews: some View {
        WorkListMonth_View()
    }
}
