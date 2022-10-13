import SwiftUI

struct Tabbar: View {
    @State var  selectedIndex = 0
    private var brandGradient = Gradient(colors: [Color.init("LightRed"), Color.init("Red")])
    var body: some View {
        VStack {
            

            ZStack {
                HStack {
                    Button {
                        self.selectedIndex = 0
                    } label: {
                        TabbarButton(imageName: "checkmark.circle.fill", buttonText: "My Task")
                    }
                    .foregroundColor(self.selectedIndex == 0 ? .white  : .gray)

                    Spacer(minLength: 12)

                    Button  {
                        self.selectedIndex = 1
                    } label: {
                        TabbarButton(imageName: "square.grid.2x2.fill", buttonText: "Menu")
                    }
                    .foregroundColor(self.selectedIndex == 1 ? .white  : .gray)

                    Spacer().frame(width: 120)

                    Button {
                        self.selectedIndex = 2
                    } label: {
                        TabbarButton(imageName: "list.bullet.rectangle.portrait.fill", buttonText: "Quick")
                    }
                    .foregroundColor(self.selectedIndex == 2 ? .white : .gray)

                    Spacer(minLength: 12)

                    Button  {
                        self.selectedIndex = 3
                    } label: {
                        TabbarButton (imageName: "person.fill", buttonText: "Profile")
                    }
                    .foregroundColor(self.selectedIndex == 3 ? .white : .gray)
                }
                .padding()
                .padding(.horizontal, 22)
                .background(Color.init("DarkPurple"))

                Button {

                } label: {
                    Text("+")
                        .font(.custom("Roboto-ThinItalic", size: 25))
                        .foregroundColor(.white)
                        .frame(width: 70, height: 70)
                        .background(LinearGradient(gradient: brandGradient, startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(35)
                        .offset(x: 8, y: -25)

                }
            }
        }
        .navigationBarHidden(true)
    }

}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}


struct TabbarButton: View {
    var imageName : String
    var buttonText: String
    var body: some View {
        VStack {
            Image (systemName: imageName)
                .font(.system(size: 25))
                .padding(.bottom, 3)
            Text(buttonText)
                .font(.custom("Roboto-ThinItalic", size: 12))
        }
    }
}
