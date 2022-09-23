import SwiftUI

struct ForgotPasswordLabel: View {
    var body: some View {
        HStack(){
            Spacer()

                Text("Forgot password")
                    .font(.custom("Roboto-ThinItalic", size: 18))
                    .foregroundColor(Color("Black"))
            .padding(.trailing, 30)

        }
    }
}

struct ForgotPasswordLabel_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordLabel()
    }
}
