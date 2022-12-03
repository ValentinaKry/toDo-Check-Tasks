import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.bottom)
            VStack (alignment: .center){
                Text("Profile")
                    .font(.custom("Roboto-ThinItalic", size: 20))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("White"))
                    .foregroundColor(Color("Black"))
                    .padding(.bottom)
                UsersCard()
                ScrollView(.horizontal) {
                    HStack {
                        Text("Events")
                        Text("12 Tasks")
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct UsersCard: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Image("Avatar")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .cornerRadius(32)
                    .padding(.horizontal, 4)
                VStack(alignment: .leading) {
                    Text("Stephen Chow")
                        .font(.custom("Roboto-ThinItalic", size: 18))
                    Text(verbatim: "pangcheo1210@gmail.com")
                        .font(.custom("Roboto-Medium", size: 18))
                        .foregroundColor(Color("Gray"))

                }
            }
            HStack {
                VStack (alignment: .leading){
                    Text("120")
                        .font(.custom("Roboto-ThinItalic", size: 18))
                    Text("Created Tasks")
                        .font(.custom("Roboto-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                }
                .padding()

                VStack (alignment: .leading){
                    Text("80")
                        .font(.custom("Roboto-ThinItalic", size: 18))
                    Text("Completed Tasks")
                        .font(.custom("Roboto-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                }
            }
        }
        .frame(width: 343, height: 190)
        .background(Color("White"))
        .cornerRadius(5)
        .shadow(color: Color("Gray").opacity(0.2), radius: 3)
    }
}
