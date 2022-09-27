
import SwiftUI

struct WorkListMonth_View: View {
    @State var currentDate: Date = Date()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        .safeAreaInset(edge: .bottom) {
            HStack {

                Button {

                } label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Red"), in: Capsule())
                }

                Button {

                } label: {
                    Text("Add Reminder")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Blue"), in: Capsule())
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.top, 10)
            .background(.ultraThinMaterial)
        }

    }
}

struct WorkListMonth_View_Previews: PreviewProvider {
    static var previews: some View {
        WorkListMonth_View()
    }
}
