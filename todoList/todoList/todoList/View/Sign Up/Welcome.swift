
import SwiftUI

struct Welcome: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    var body: some View {

        VStack {
                MainTitle(firstTitle: "Welcome", description: "Sign up to continue")
                Capsule()
                    .strokeBorder(Color("MainColor"),lineWidth: 2)
                    .background(Capsule().foregroundColor(Color(uiColor: .systemGray4)))
                    .frame(width: 107, height: 104)

                UsernameForm()
                    .padding(.bottom, 5)
                PasswordForm()

                VStack(spacing: 60) {
                    RedButton(nameButton: "Sign Up")
                    NavigationLink  {
                        WelcomeBack()
                    } label: {
                        SmallButton(title: "Sign In")
                    }
                    Rectangle()
                        .frame(width: 40, height: 10)
                        .foregroundColor(Color("White"))

                }
                .padding(.top, 70)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image("arrow.left")
                    .foregroundColor(Color.black)
            })
            .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in

                        if(value.startLocation.x < 20 && value.translation.width > 100) {
                            self.mode.wrappedValue.dismiss()
                        }

                    }))
        
    }

}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}


