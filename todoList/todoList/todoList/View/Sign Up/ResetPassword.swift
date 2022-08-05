
import SwiftUI

struct ResetPassword: View {
    var body: some View {
        VStack {
            MainTitle(firstTitle: "Reset Password", description: "Reset code was sent to your email. Please enter the code and create new password")
            PasswordForm(title: "Reset code", textField: "Enter your number")
            PasswordForm(title: "New password", textField: "Enter your password")
            PasswordForm(title: "Confirm password", textField: "Enter your confirm password")
            RedButton(nameButton: "Change password")
                .padding(.top, 40)
        }
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
