
import SwiftUI

struct WelcomeBack: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    var body: some View {

            VStack {
                MainTitle(firstTitle: "Welcome back", description: "Sign in to continue")
                UsernameForm()
                PasswordForm()
                NavigationLink  {
                    ForgotPassword()
                } label: {
                    ForgotPasswordLabel()
                }

                VStack (spacing: 40){
                    RedButton(nameButton: "Sign In")
                    SmallButton(title: "Sign Up")
                        .padding(.top, 60)
                    Rectangle()
                        .frame(width: 40, height: 70)
                        .foregroundColor(Color("White"))
                }
                .padding(.top, 60)

            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:Button(action : {
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

struct WelcomeBack_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBack()
    }
}


