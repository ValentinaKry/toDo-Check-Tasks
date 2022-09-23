
import SwiftUI

struct Welcome: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    @ObservedObject var model: WelcomeViewModel

    var body: some View {

        VStack {
            MainTitle(firstTitle: "Welcome", description: "Sign up to continue")
            Button {

            } label: {
            Capsule()
                .strokeBorder(Color("Red"),lineWidth: 2)
                .background(Capsule().foregroundColor(Color(uiColor: .systemGray4)))
                .frame(width: 107, height: 104)
            }

            UsernameForm()
                .padding(.bottom, 5)
            PasswordForm()

            VStack(spacing: 60) {
                Button {
                    model.finTap()
                    hideKeyboard()
                } label: {
                    RedButton(nameButton: "Sign Up")
                }
               

                Button  {
                    model.endTap()
                } label: {
                    SmallButton(title: "Sign In")
                }

                Spacer()

            }
            .padding(.top, 70)
        }

        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image("arrow.left")
                .foregroundColor(Color.black)
        })
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in

            if(value.startLocation.x < 20 && value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }

        }))
        .onTapGesture {
            hideKeyboard()
        }


    }

}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        let view = WelcomeViewModel()
        Welcome( model: view)
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

