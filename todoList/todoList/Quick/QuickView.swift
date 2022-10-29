import SwiftUI

struct QuickView: View {
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                Text("Quick Notes")
                    .font(.custom("Roboto-ThinItalic", size: 20))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .foregroundColor(Color("Black"))
                    .padding(.bottom, 20)

                ScrollView {
                    NotesView(color: "Blue", note: "Meeting with Lessica in Central Park at 10: 30PM")
                    NotesView(color: "Pink", note: "Replace dashboard icon with more colorfull ones")
                }
            }
        }
    }
}

struct QuickView_Previews: PreviewProvider {
    static var previews: some View {
        QuickView()
    }
}

struct NotesView: View {
    var color: String
    var note: String
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color(color))
                .frame(width: 121, height: 3)
                .padding(.horizontal)
                .offset(y: -4)
            Text(note)
                .font(.custom("Roboto-ThinItalic", size: 16))
                .padding()
                //.padding(.horizontal)
                .frame(width: 350)
                .lineSpacing(14)

        }
        .padding(.vertical, 4)
        .background(.white)
        //.contentShape(Rectangle())
        .cornerRadius(5)
        .shadow(color: .gray.opacity(0.17), radius: 5, x: 4, y: 9)
        .padding(.bottom)
    }
}
