import SwiftUI

struct Walkthrought: View {

    @State private var currentStep = 0
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentStep) {
                    ForEach(0..<onBoardingSteps.count, id: \.self) { it in
                        VStack {
                            Spacer()
                            Image(onBoardingSteps[it].image)
                            Text(onBoardingSteps[it].title)
                                .font(.custom("Roboto-ThinItalic", size: 24))
                                .foregroundColor(Color("Black"))
                                .padding(.top, 40)
                                .padding(.bottom, 3)
                            Text(onBoardingSteps[it].quistion)
                                .font(.custom("Roboto-Medium", size: 18))
                                .foregroundColor(Color("Black"))

                            Spacer()

                            HStack {
                                ForEach(0..<onBoardingSteps.count, id: \.self) { it in
                                    if it == currentStep {
                                        Circle()
                                            .frame(width: 8, height: 8)
                                    } else {
                                        Circle()
                                            .frame(width: 8, height: 8)
                                            .opacity(0.3)
                                    }
                                }
                            }
                            .padding(.bottom)

                            ZStack() {
                                Image(onBoardingSteps[it].footerBg)
                                    .resizable()

                                    .frame(height: 280)

                                NavigationLink  {
                                    Welcome()
                                } label: {
                                    Text("Get Started")
                                        .font(.custom("Roboto-ThinItalic", size: 18))
                                        .padding(16)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.white)
                                        .cornerRadius(5)
                                        .shadow(color: Color.black.opacity(0.2) , radius: 8, x: 8.0, y: 8.0)
                                        .padding(.horizontal, 27)
                                        .foregroundColor(Color("Black"))
                                }
                                .navigationBarHidden(true)
                                .navigationTitle("Hello")
                            }
                        }
                        .tag(it)
                        .edgesIgnoringSafeArea(.bottom)
                    }
                }

                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
           }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct _Walkthrought_Previews: PreviewProvider {
    static var previews: some View {
        Walkthrought()
    }
}
