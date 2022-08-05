
import SwiftUI

struct RedButton: View {

    var nameButton: String
    var body: some View {

            Text(nameButton)
                .font(.custom("Roboto-ThinItalic", size: 18))
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(Color("MainColor"))
                .cornerRadius(5)
                .padding(.horizontal, 27)
                .foregroundColor(.white)

    }
}

struct RedButton_Previews: PreviewProvider {
    static var previews: some View {
        RedButton(nameButton: "Sign Up")
            .previewLayout(.fixed(width: 350, height: 70))
    }
}
