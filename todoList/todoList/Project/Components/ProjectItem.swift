import SwiftUI

struct ProjectItem: View {
    var project: ProjectModel
    var body: some View {
        Button {

        } label: {
            VStack (alignment: .leading, spacing: 16){
                Circle()
                    .frame(width: 14, height: 14)
                    .foregroundColor(Color(project.color))
                    .overlay {
                        Circle()
                            .frame(width: 26, height: 26)
                            .opacity(0.4)
                            .foregroundColor(Color(project.color))
                    }
                    .padding(.bottom, 25)
                Text(project.title)
                    .font(.custom("Roboto-ThinItalic", size: 18))
                    .foregroundColor(Color("Black"))
                Text("\(project.intItems) \(project.intItems > 1 ? "Tasks" : "Task")")
                    .font(.custom("Roboto-Medium", size: 18))
                    .foregroundColor(Color("Gray"))

            }
            .frame(width: 165, height: 180)
            .background(Color("White"))
            .border(Color.gray, width: 2)
            .cornerRadius(7)

        }
    }
}


struct ProjectItem_Previews: PreviewProvider {
    static var previews: some View {
        ProjectItem(project: projectList[0])
    }
}
