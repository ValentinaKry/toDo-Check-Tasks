
import SwiftUI

struct SmallButton: View {
    var title: String
    var body: some View {

            Text(title)
                .font(.custom("Roboto-BlackItalic", size: 18))
                .foregroundColor(Color("MainColor"))

    }
}

struct SmallButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallButton(title: "Sign In")
    }
}
