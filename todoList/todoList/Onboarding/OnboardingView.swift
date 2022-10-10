import SwiftUI

struct OnboardingView: View {

        // MARK: - Variables
    @State private var currentIndex = 0
    @ObservedObject var model: OnboardingViewModel
    var doneRequested: () -> ()
    
    private let screens: [OnboardView] = [
        OnboardView(imageName: "Screen1",
                    title: "Welcom to todo list",
                    description: "Whats going to happen tomarrow?"),

        OnboardView(imageName: "Screen2",
                    title: "Work happens",
                    description: "Get notified when work happens."),

        OnboardView(imageName: "Screen3",
                    title: "Tasks and assign",
                    description: "Task and assign them to colleagues.")
    ]


    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentIndex.animation()) {
                ForEach(0..<screens.count, id: \.self) { index in
                    screens[index]
                        .id(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .ignoresSafeArea(.container, edges: .all)
            .overlay(Fancy3DotsIndexView(numberOfPages: screens.count, currentIndex: currentIndex))

            ZStack {
                switch currentIndex {
                case 0:
                    Image("Red")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 438, height: 322)
                case 1:
                    withAnimation {
                        Image("Blue")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 438, height: 322)
                    }
                case 2:
                    Image("Purple")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 438, height: 322)
                default:
                    Image("Red")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 438, height: 322)
                }

                Button {
                    model.endTap()
                } label: {
                    Text("Get Started")
                        .font(.custom("Roboto-ThinItalic", size: 18))
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(5)
                        .padding(.horizontal, 37)
                        .foregroundColor(Color.init("Black"))
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
                }
            }
            .navigationBarHidden(true)
        }

    }
}


struct OnboardView: View {

        // MARK: - Variables
    @State private var navigate = false

    let imageName: String
    let title: String
    let description: String


        // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .frame(width: 305, height: 252)
                .padding(.init(top: 108, leading: 35, bottom: 0, trailing: 35))
                .ignoresSafeArea()
            Spacer()
            Text(title)
                .font(.custom("Roboto-ThinItalic", size: 24))
                .foregroundColor(Color.init("Black"))
                .padding(.init(top: 0, leading: 0, bottom: 11, trailing: 0))

            Text(description)
                .font(.custom("Roboto-Medium", size: 19))
                .foregroundColor(Color.init("Black"))

            Spacer()
        }
        .offset(y: -70)
    }

}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        let view  = OnboardingViewModel()
        OnboardingView(model: view, doneRequested: { })
    }
}

struct Fancy3DotsIndexView: View {

        // MARK: - Variables
    let numberOfPages: Int
    let currentIndex: Int

    private let circleSize:    CGFloat = 8
    private let circleSpacing: CGFloat = 8

    private let primaryColor = Color.black
    private let secondaryColor = Color.black.opacity(0.2)

        // MARK: - Body
    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(currentIndex == index ? primaryColor : secondaryColor)
                    .scaleEffect(1)
                    .frame(width: circleSize, height: circleSize)
                    .id(index)
            }
        }
        .offset(y: -20)
        .padding(.top, 450)
    }
}

