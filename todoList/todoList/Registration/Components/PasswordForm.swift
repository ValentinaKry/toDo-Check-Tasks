import SwiftUI

struct PasswordForm: View {
    var title: String = "Password"
    var textField: String = "Enter your password"
    @Binding var password: String
//    init(title: String, textField: String) {
//        self.title = title
//        self.textField = textField
//    }

    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            Text(title)
                .font(.custom("Roboto-Medium", size: 20))
                .padding(.bottom, 7)
                .foregroundColor(Color("Black"))
            SecureField(textField, text: $password)
                .font(.custom("Roboto", size: 16))
                .foregroundColor(Color("Black"))
            Divider()
        }
        .padding()
    }
}

struct PasswordForm_Previews: PreviewProvider {
    @State static var password = ""
    static var previews: some View {
        PasswordForm(password: $password)
    }
}
