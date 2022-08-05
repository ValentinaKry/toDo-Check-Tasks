
import SwiftUI

struct Welcome: View {
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

                }
                .padding(.top, 50)
            }
        
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}


