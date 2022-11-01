
import SwiftUI

struct WorkListToday_View: View {
    @StateObject var viewModel = TaskViewModel()
    let date = Date()

    var body: some View {

        VStack (alignment: .leading, spacing: 5){
            Spacer()
            Text("TODAY, " + date.formatted(.dateTime.day().month())
                 + "/" + date.formatted(.dateTime.year()))
            .textCase(.uppercase)
            .font(.custom("Roboto-ThinItalic", size: 14))
            .foregroundColor(Color.init("Black"))
            .padding(.horizontal)

//            List(0..<1) { item in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        if filter == .all {
                            ForEach(viewModel.items) { item in
                                TaskView(task: $viewModel.items[getIndex(tasks: item)],
                                         tasks: $viewModel.items)
                            }
                        } else if filter == .complited {

                        }

                    }
//                }
//                .listRowSeparator(.hidden)
            }


//            .listStyle(.plain)
        }
    }

    func getIndex(tasks: TaskModel) -> Int {
        return viewModel.items.firstIndex { (task1) -> Bool in
            return tasks.id == task1.id
        } ?? 0
    }
}

struct WorkListToday_View_Previews: PreviewProvider {
    static var previews: some View {
        WorkListToday_View()
    }
}
