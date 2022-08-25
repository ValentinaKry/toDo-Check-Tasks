
import SwiftUI

struct WaveForm: Shape {


    var yOffset : CGFloat = 0.5

    var animatableData: CGFloat {
        get  {
            return yOffset
        }
        set {
            yOffset = newValue
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - 5))

        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX * 0.65, y: rect.maxY + (rect.maxY * yOffset)),
                      control2:CGPoint(x: rect.maxX * 0.3, y: rect.maxY - (rect.maxY * yOffset)))

        path.closeSubpath()


        return path
    }
}

struct WaveForm_Previews: PreviewProvider {
    static var previews: some View {
        WaveForm(yOffset: 0.6)
            .stroke(Color.red, lineWidth: 5)
            .frame(height: 200)
            .padding()
    }
}
