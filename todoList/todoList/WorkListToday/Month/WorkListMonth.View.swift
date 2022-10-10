
import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}


struct WorkListMonth_View: View {
    @State var currentDate: Date = Date()
    @State private var showMonth = false
    var body: some View {
        VStack (spacing: 15){
            NavBar()
            ScrollView(.vertical, showsIndicators: false) {
                HStack (spacing: 20){

                    HStack (alignment: .center, spacing: 10) {
                        Text(extraDate()[1])
                        Text(extraDate()[0])
                    }
                    .font(.custom("Roboto-ThinItalic", size: 14))
                    .textCase(.uppercase)
                    .foregroundColor(Color("Black"))

                    Button {
                           
                        showMonth.toggle()

                    } label: {
                        Image(systemName: "chevron.down")
                            .font(.title3)
                            .foregroundColor(Color("Black"))
                            .rotationEffect(.degrees(showMonth ? 180 : 0))
                            .padding()
                            .animation(.easeInOut, value: showMonth)
                    }

                }
                .padding(.horizontal)
                if showMonth {
                    VStack(spacing: 20) {
                        CustomDatePicker(currentDate: $currentDate)
                            .transition(.slide)
                    }
                    .padding(.vertical)
                } else {
                    WeekView()
                }

            }
            EverydayTask(currentDate: $currentDate)



            Tabbar()
        }
    }

    func extraDate() ->[String] {
        let fornatter = DateFormatter()
        fornatter.dateFormat = "YYYY MMMM"

        let date =  fornatter.string(from: currentDate)

        return date.components(separatedBy: " ")
    }
}

struct WorkListMonth_View_Previews: PreviewProvider {
    static var previews: some View {
        WorkListMonth_View()
    }
}
