
import SwiftUI

struct UsernameForm: View {

    @Binding var name: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Username")
                .font(.custom("Roboto-Medium", size: 20))
                .padding(.bottom, 7)
                .foregroundColor(Color("Black"))
            TextField("Enter your name", text: $name)
                .font(.custom("Roboto", size: 16))
                .foregroundColor(Color("Black"))
            Divider()
        }
        .padding()
    }
}

struct UsernameForm_Previews: PreviewProvider {
    @State static var name = ""
    static var previews: some View {
        UsernameForm(name: $name)
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
