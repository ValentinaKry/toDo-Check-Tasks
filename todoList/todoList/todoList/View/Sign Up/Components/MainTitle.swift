
import SwiftUI

struct MainTitle: View {
    var firstTitle: String
    var description: String
    var body: some View {

        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(firstTitle)
                    .font(.custom("Roboto-ThinItalic", size: 32))
                    .foregroundColor(Color("Black"))
                Text(description)
                    .font(.custom("Roboto-Medium", size: 16))
                    .foregroundColor(.secondary)
            }
            .padding()
            Spacer()
        }
        .padding(.bottom, 15)
    }
}

struct MainTitle_Previews: PreviewProvider {
    static var previews: some View {
        MainTitle(firstTitle: "Welcome", description: "Sign up to continue")
    }
}

