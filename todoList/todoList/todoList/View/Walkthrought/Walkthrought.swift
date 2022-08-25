import SwiftUI

struct Walkthrough: View {

    var screenSize: CGSize
    @State var offset: CGFloat = 0
    @State var animation = false
    var body: some View {
        VStack {
            OffsetPageTabView(offset: $offset) {
                HStack(spacing: 0) {
                    ForEach(intros) {intro in

                        VStack {

                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screenSize.height / 3)

                            VStack (alignment: .center, spacing: 13) {
                                Text(intro.title)
                                    .font(.custom("Roboto-ThinItalic", size: 24))

                                Text(intro.question)
                                    .font(.custom("Roboto-Medium", size: 18))

                            }
                            .padding(.top, 50)
                            .foregroundColor(Color.init("Black"))
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding()
                        .padding(.top, 50)
                        .frame(width: screenSize.width)
                    }
                }
            }


            VStack(spacing: 0) {

                HStack(spacing: 12) {
                    ForEach(intros.indices, id: \.self) {index in

                        Capsule()
                            .fill(getIndex() == index ? Color.init("Black") : Color.gray)
                            .frame(width: getIndex() == index ? 20 : 8, height: 8)
                    }
                }
                .overlay(
                    Capsule()
                        .fill(Color.init("black"))
                        .frame(width: 20, height: 8)
                        .offset(x: getIndicatorOffset())

                    ,alignment: .leading
                )
                .offset( y: -20)

            }

                ZStack {
                    WaveForm(yOffset: 0.15)
                        .fill(Color("screen\(Int(CGFloat(getIndex()).rounded() + 1))").opacity(0.2))
                        .frame(height: 280)
                        .rotationEffect(.degrees(180))
                        .offset(x: -50)
                        .animation(.easeInOut, value: getIndex())

                    WaveForm(yOffset: -0.3)
                        .fill(Color("screen\(Int(CGFloat(getIndex()).rounded() + 1))"))
                        .frame(height: 280)
                        .rotationEffect(.degrees(180))
                        .animation(.easeInOut, value: getIndex())


                    Button {

                    } label: {
                        Text("Get Started")
                            .font(.custom("Roboto-ThinItalic", size: 18))
                            .padding(16)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2) , radius: 8, x: 8.0, y: 8.0)
                            .padding(.horizontal, 27)
                            .padding(.bottom, screenSize.height / 15)
                            .foregroundColor(.black)
                    }
                }
        }
        .edgesIgnoringSafeArea(.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

    }

    func getIndicatorOffset() -> CGFloat {
        let progress = offset / screenSize.width

        let maxWidth: CGFloat = 12 + 8
        return progress * maxWidth
    }

    func getIndex() -> Int {
        let progress = round(offset / screenSize.width)

        let index = min(Int(progress), intros.count - 1)
        return index
    }
}

struct Walkthrough_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in

                    let size = proxy.size
                    Walkthrough(screenSize: size)
                }
    }
}
