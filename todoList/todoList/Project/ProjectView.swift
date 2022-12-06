import SwiftUI

struct ProjectView: View {
    @State private var showAddProject = false
    var colums = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        ZStack {

            Color("Background")
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                Text("Project")
                    .font(.custom("Roboto-ThinItalic", size: 20))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("White"))
                    .foregroundColor(Color("Black"))
                ScrollView{
                    LazyVGrid(columns: colums, spacing: 20) {
                        ForEach(projectList, id: \.id) { project in
                            ProjectItem(project: project)

                        }
                        Button {
                            withAnimation (.easeInOut){
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
                    .padding()
                }
                Spacer()
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

