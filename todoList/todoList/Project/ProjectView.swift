import SwiftUI

struct ProjectView: View {
    @State private var showAddProject = false
    var body: some View {
        ZStack {

            Color("Background")
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                Text("Project")
                    .font(.custom("Roboto-ThinItalic", size: 20))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .foregroundColor(Color("Black"))
                VStack(alignment:.leading) {
                    VStack {
                        HStack {
                            ProjectItem()
                            ProjectItem()
                        }
                        HStack {
                            ProjectItem()
                            ProjectItem()
                        }

                    }
                    Button {
                        withAnimation {
                            showAddProject = true
                        }

                    } label: {
                        Text("+")
                            .foregroundColor(.white)
                            .font(.custom("Roboto-ThinItalic", size: 24))
                            .frame(width: 100, height: 100)
                            .background(Color("Blue"))
                            .cornerRadius(5)
                    }
                    .padding()

                }

                Spacer()

                Tabbar()
            }
            AddProjectView(isShowing: $showAddProject)

        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}

struct ProjectItem: View {
    var body: some View {
        Button {

        } label: {
            VStack (alignment: .leading, spacing: 16){
                Circle()
                    .frame(width: 14, height: 14)
                    .foregroundColor(Color("Pink"))
                    .overlay {
                        Circle()
                            .frame(width: 26, height: 26)
                            .opacity(0.4)
                            .foregroundColor(Color("Pink"))
                    }
                    .padding(.bottom, 25)
                Text("Home")
                    .font(.custom("Roboto-ThinItalic", size: 18))
                    .foregroundColor(Color("Black"))
                Text("10 Tasks")
                    .font(.custom("Roboto-Medium", size: 18))
                    .foregroundColor(Color("Gray"))

            }
            .frame(width: 165, height: 180)
            .background(Color.white)
            .cornerRadius(7)

        }
    }
}
