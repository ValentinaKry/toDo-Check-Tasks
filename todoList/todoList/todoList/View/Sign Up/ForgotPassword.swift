
import SwiftUI

struct ForgotPassword: View {
    var body: some View {
        VStack {
           MainTitle(firstTitle: "Forgot Password", description: "Please enter email to recevie your password reset instructions")
            UsernameForm()
            RedButton(nameButton: "Send Request")

        }
        
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
