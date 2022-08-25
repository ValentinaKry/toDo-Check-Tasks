
import SwiftUI

struct ResetPassword: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    var body: some View {
        VStack {
            MainTitle(firstTitle: "Reset Password", description: "Reset code was sent to your email. Please enter the code and create new password")
            PasswordForm(title: "Reset code", textField: "Enter your number")
            PasswordForm(title: "New password", textField: "Enter your password")
            PasswordForm(title: "Confirm password", textField: "Enter your confirm password")
            NavigationLink  {
                Successful()
            } label: {
                RedButton(nameButton: "Change password")
                    .padding(.top, 40)
            }

            Rectangle()
                .frame(width: 40, height: 170)
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

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
