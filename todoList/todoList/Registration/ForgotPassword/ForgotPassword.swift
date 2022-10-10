
import SwiftUI

struct ForgotPassword: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    @ObservedObject var viewModel : ForgotPasswordViewModel
    var body: some View {
        VStack {
           MainTitle(firstTitle: "Forgot Password", description: "Please enter email to recevie your password reset instructions")
                .padding(.top, 60)
            UsernameForm(name: $viewModel.email)
            Button  {
                viewModel.sendRequest()
            } label: {
                RedButton(nameButton: "Send Request")
            }
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image("arrow.left")
                .foregroundColor(Color.black)
                .font(.system(size: 20))
        })
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in

                    if(value.startLocation.x < 20 && value.translation.width > 100) {
                        self.mode.wrappedValue.dismiss()
                    }

                }))
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ForgotPasswordViewModel()
        ForgotPassword(viewModel: viewModel)
    }
}
