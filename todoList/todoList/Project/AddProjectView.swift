
import SwiftUI

struct AddProjectView: View {
    @EnvironmentObject var projectVM: ProjectViewModel

    @Binding var isShowing : Bool
    @State private var projectTitle = ""
    @State private var selectedIndex = 0
    @State private var selectedColor: ProjectColor = ProjectColor.blue

    var colorArray = ["Blue", "Pink", "Green", "Ink", "Yellow"]
    var body: some View {
        ZStack {
            if isShowing {
                Color.black
                    .opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.custom("Roboto-ThinItalic", size: 18))
                        .foregroundColor(Color("Black"))
                        .padding()
                    TextField("Enter project title", text: $projectTitle)
                        .font(.custom("Roboto-Medium", size: 15))
                        .padding(.horizontal)
                    
                    Text("Choose Color")
                        .font(.custom("Roboto-ThinItalic", size: 18))
                        .foregroundColor(Color("Black"))
                        .padding()
                    HStack {
                        ForEach(0..<colorArray.count, id: \.self) { i in
                            Button  {
                                self.selectedIndex = i
                            } label: {
                                Text("")
                                    .foregroundColor(.white)
                                    .font(.custom("Roboto-ThinItalic", size: 24))
                                    .frame(width: 48, height: 48)
                                    .background(Color(colorArray[i]))
                                    .cornerRadius(5)
                                    .overlay {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(selectedIndex == i ? .white : Color(colorArray[i]))
                                    }
                            }
                            .tag(i)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
                .frame(width: 320, height: 240)
                .background(.white)
                .cornerRadius(5)
                //try do add New Project
                .onTapGesture{
                    print("New Project")
                    //savedProject()

                }
            }
        }
    }
}

struct AddProjectView_Previews: PreviewProvider {

    static var previews: some View {
        ProjectView()
    }
}

extension AddProjectView {
    private func savedProject() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let datePulished = dateFormatter.string(from: now)
        print(datePulished)
        let project = ProjectModel(title: projectTitle, color: colorArray[0], intItems: 0)
        projectVM.addProject(project: project)
    }
}
