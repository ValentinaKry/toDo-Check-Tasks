
import SwiftUI

struct WaveShape: View {

    var color: Color
    var amplify: CGFloat
    var isReversed: Bool
    var body: some View {

            Canvas { context, size in

                context.translateBy(x: isReversed ? 0 : -220, y: 140)

                context.fill(getPath(size: size), with: .color(color))

                context.translateBy(x: -size.width, y: 0)

                context.fill(getPath(size: size), with: .color(color))

                context.translateBy(x: size.width * 2, y: 0)

                context.fill(getPath(size: size), with: .color(color))
            }
            .edgesIgnoringSafeArea(.bottom)
    }

    func getPath(size: CGSize) -> Path{

        return Path {path in

            let midHeight = size.height / 2

            let width = size.width

            path.move(to: CGPoint(x: isReversed ? -30 : 0, y: midHeight))

            path.addCurve(to: CGPoint(x: width, y: isReversed ? midHeight - 20 : midHeight),
                          control1: CGPoint(x: width * 0.4, y:midHeight + amplify),
                          control2: CGPoint(x: width * 0.65, y:midHeight - amplify))

            path.addLine(to: CGPoint(x: width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
        }
    }
}

struct WaveShape_Previews: PreviewProvider {
    static var previews: some View {
        WaveShape(color: .mint, amplify: 75, isReversed: true)
    }
}

