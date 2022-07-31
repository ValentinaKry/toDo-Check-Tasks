
import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let quistion: String
    let footerBg: String
}

private let onBoardingSteps = [
    OnBoardingStep(image: "undrawEvents", title: "Welcome to todo list", quistion: "Whats going to happend tomorrow?", footerBg: "redWave"),
    OnBoardingStep(image: "undrawSuperhero", title: "Work happens", quistion: "Get notifed when work happens.", footerBg: "blueWave"),
    OnBoardingStep(image: "undrawAnalysis", title: "Tasks and assign", quistion: "Task and assing them to colleagues.", footerBg: "purpleWave")

]

struct Walkthrought: View {
    @State private var currentStep = 0
    var body: some View {
        VStack {

            TabView(selection: $currentStep) {
                ForEach(0..<onBoardingSteps.count, id: \.self) { it in
                    VStack {
                        Spacer()
                        Image(onBoardingSteps[it].image)
                        Text(onBoardingSteps[it].title)
                            .font(.custom("Roboto-ThinItalic", size: 24))
                            .padding(.top, 40)
                            .padding(.bottom, 3)
                        Text(onBoardingSteps[it].quistion)
                            .font(.custom("Roboto-Regular", size: 18))

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


                            Button(action: {
                                if self.currentStep < onBoardingSteps.count - 1 {
                                    self.currentStep += 1
                                }
                            }) {

                            Text("Get Started")
                                .font(.custom("Roboto-ThinItalic", size: 18))
                                .padding(16)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.4) , radius: 8, x: 8.0, y: 8.0)
                                .padding(.horizontal, 27)
                                .foregroundColor(.black)
                        }
                              .buttonStyle(PlainButtonStyle())
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

struct Walkthrought_Previews: PreviewProvider {
    static var previews: some View {
        Walkthrought()
    }
}
