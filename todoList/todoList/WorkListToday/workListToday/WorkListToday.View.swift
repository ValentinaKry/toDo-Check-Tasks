
import SwiftUI

struct WorkListToday_View: View {
    @StateObject var viewModel = TaskViewModel()
    let date = Date()


    var body: some View {
        VStack (alignment: .leading, spacing: 5){
            Spacer()
            Text("TODAY, " + date.formatted(.dateTime.day().month())
                 + "/" + date.formatted(.dateTime.year()))
                .font(.custom("Roboto-ThinItalic", size: 16))
                .foregroundColor(Color.init("Gray"))
                .padding(.horizontal)

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.items) { item in
                        TaskView(task: $viewModel.items[getIndex(tasks: item)],
                                 tasks: $viewModel.items)
                    }
                }
            }
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
