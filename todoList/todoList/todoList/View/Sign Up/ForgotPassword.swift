
import SwiftUI

struct ForgotPassword: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    var body: some View {
        VStack {
           MainTitle(firstTitle: "Forgot Password", description: "Please enter email to recevie your password reset instructions")
                .padding(.top, 60)
            UsernameForm()
            NavigationLink  {
                ResetPassword()
            } label: {
                RedButton(nameButton: "Send Request")
            }
            Spacer()
            Rectangle()
                .frame(width: 40, height: 470)
                .foregroundColor(Color("White"))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image("arrow.left")
                .foregroundColor(Color.black)
                .font(.system(size: 20))
        })
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in

                    if(value.startLocation.x < 20 && value.translation.width > 100) {
                        self.mode.wrappedValue.dismiss()
                    }

                }))
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
