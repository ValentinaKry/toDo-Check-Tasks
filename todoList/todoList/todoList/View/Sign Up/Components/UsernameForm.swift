
import SwiftUI

struct UsernameForm: View {

    @State private var email: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Username")
                .font(.custom("Roboto-Medium", size: 20))
                .padding(.bottom, 7)
                .foregroundColor(Color("Black"))
            TextField("Enter your email", text: $email)
                .font(.custom("Roboto", size: 16))
                .foregroundColor(Color("Black"))
            Divider()
        }
        .padding()
    }
}

struct UsernameForm_Previews: PreviewProvider {
    static var previews: some View {
        UsernameForm()
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
