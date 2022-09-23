
import SwiftUI

struct WorkListMonth_View: View {
    @State var currentDate: Date = Date()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                CustomDatePicker(currentDate: $currentDate)
            }
        }
    }
}

struct WorkListMonth_View_Previews: PreviewProvider {
    static var previews: some View {
        WorkListMonth_View()
    }
}
