
import SwiftUI
import Combine

struct Filter: View {
    @Binding var isShowing : Bool
    @State var selectedIndex = 0
    @StateObject var items = TaskViewModel()
    
    var body: some View {
        ZStack {
            if isShowing {
                Color.black
                    .opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                VStack (spacing: 20){
                    Button {
                        selectedIndex = 0

                    } label: {
                        HStack (spacing: 40){
                            Text("Incomplete Tasks")
                                .font(.custom("Roboto-ThinItalic", size: 17))
                                .foregroundColor(Color("Black"))

                                Image(systemName: "checkmark")
                                .foregroundColor(selectedIndex == 0  ? .green : .white)
                        }
                    }
                 //   Text("\(items.items)")
//                    Text("\(items.items.filter($0.isCompleted).count)")
                    Button {
                        selectedIndex = 1
                    } label: {
                        HStack (spacing: 40){
                            Text("Completed Tasks")
                                .font(.custom("Roboto-ThinItalic", size: 17))
                                .foregroundColor(Color("Black"))

                                Image(systemName: "checkmark")
                                .foregroundColor(selectedIndex == 1  ? .green : .white)
                        }
                    }

                    Button {
                        selectedIndex = 2
                    } label: {
                        HStack (spacing: 40){
                            Text("All Tasks")
                                .font(.custom("Roboto-ThinItalic", size: 17))
                                .foregroundColor(Color("Black"))


                                Image(systemName: "checkmark")
                                .foregroundColor(selectedIndex == 2 ? .green : .white)

                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)
                .frame(width: 225,height: 140)
                .background(.white)
                .cornerRadius(7)
                .padding(.bottom, 520)
                .padding(.leading, 120)
            }

        }
        .frame(maxWidth: .infinity,maxHeight: .infinity )
        .ignoresSafeArea()
        .animation(.easeInOut)
    }


}

struct Filter_Previews: PreviewProvider {
    static var previews: some View {
        NavbarWorkListToday_View()
    }
}

