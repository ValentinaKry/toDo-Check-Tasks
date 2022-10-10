
import SwiftUI

struct WelcomeBack: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    @ObservedObject var viewModel: WelcomeBackViewModel
    var body: some View {

        VStack {
            MainTitle(firstTitle: "Welcome back", description: "Sign in to continue")
            UsernameForm(name: $viewModel.email)
            PasswordForm(password: $viewModel.password)
            Button  {
                hideKeyboard()
                viewModel.forgotPassword()
            } label: {
                ForgotPasswordLabel()
            }

            VStack (spacing: 40){
                Button {
                    hideKeyboard()
                    viewModel.signInTap()

                } label: {
                    RedButton(nameButton: "Sign In")
                }

                Button {
                    hideKeyboard()
                    viewModel.signUpTap()

                } label: {
                    SmallButton(title: "Sign Up")
                        .padding(.top, 40)
                }

                Spacer()
            }
            .padding(.top, 60)

        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:Button(action : {
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

    }
}

struct WelcomeBack_Previews: PreviewProvider {
    static var previews: some View {
        let veiwModel = WelcomeBackViewModel()
        WelcomeBack( viewModel: veiwModel)
    }
}

