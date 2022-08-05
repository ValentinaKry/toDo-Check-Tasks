
import SwiftUI

struct WelcomeBack: View {
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
                }
                .padding(.top, 60)

            }
            
    }
}

struct WelcomeBack_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBack()
    }
}


