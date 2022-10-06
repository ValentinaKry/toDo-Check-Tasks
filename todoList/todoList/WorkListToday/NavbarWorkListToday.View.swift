
import SwiftUI

struct NavbarWorkListToday_View: View {
    var body: some View {
        VStack {
            NavBar()

            Spacer()

            WorkListToday_View()

            Tabbar()

        }
    }
}

struct NavbarWorkListToday_View_Previews: PreviewProvider {
    static var previews: some View {
        NavbarWorkListToday_View()
    }
}

struct NavBar: View {
    @State var selectedIndex = 0
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Work List")
                    .font(.custom("Roboto-ThinItalic", size: 20))
                    .foregroundColor(.white)
                Spacer()

                Button  {

                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .shadow(color: .black.opacity(0.4),
                                radius: 2, x: 0, y: 5)
                }
            }
            .padding()

            HStack {
                Button  {
                    self.selectedIndex = 0
                   // WorkListToday_View()
                } label: {
                    VStack {
                        Text("Today")
                            .font(.custom("Roboto-Medium", size: 18))
                            .foregroundColor(self.selectedIndex == 0 ?
                                .white: .white.opacity(0.4))
                            .padding(.bottom, 10)

                        if selectedIndex == 0 {
                            Color(uiColor: .white)
                                .frame(width: 90, height: 3)
                        } else {
                            Color("Red")
                                .frame(width: 90, height: 3)
                        }
                    }
                }

                Spacer()

                Button {
                    self.selectedIndex = 1
                    //WorkListMonth_View()
                } label: {
                    VStack {
                        Text("Month")
                            .font(.custom("Roboto-Medium", size: 18))
                            .foregroundColor(self.selectedIndex == 1 ?
                                .white: .white.opacity(0.4))
                            .padding(.bottom, 10)

                        if selectedIndex == 1 {
                            Color(uiColor: .white)
                                .frame(width: 90, height: 3)
                        } else {
                            Color("Red")
                                .frame(width: 90, height: 3)
                        }
                    }
                }

            }
            .padding(.horizontal, 68)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.init("Red"))
    }
}
