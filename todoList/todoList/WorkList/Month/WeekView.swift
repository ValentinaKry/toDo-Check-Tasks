import SwiftUI

struct WeekView: View {
    @StateObject var taskModel : TaskViewModel = TaskViewModel()
    @Namespace var animation
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(taskModel.currentWeek, id: \.self) { day in

                    VStack(spacing: 10) {

                        Text(taskModel.extractDate(date: day, format: "EEEEE"))

                            .foregroundColor(taskModel.isToday(date: day) ? .white : .gray)
                            .fontWeight(.semibold)

                        Text(taskModel.extractDate(date: day, format: "dd"))

                            .fontWeight(.semibold)
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 8, height: 8)
                            .opacity(taskModel.isToday(date: day) ? 1 : 0)

                    }
                    // MARK: Foreground Style
                    .font(.custom("Roboto-Medium", size: 15))
                    .foregroundColor(taskModel.isToday(date: day) ? .white : .black)
                    .frame(width: 40, height: 80)
                    .background(
                        ZStack {
                            if taskModel.isToday(date: day) {
                                Capsule()
                                    .fill(Color("Red"))
                                    .matchedGeometryEffect(id: "CURRENDAY", in: animation)
                            }
                        }
                    )
                    .contentShape(Capsule())
                    .onTapGesture {
                        // Updating Current Day
                        withAnimation {
                            taskModel.currentDay = day
                        }
                    }
                }
            }
             .padding(.horizontal)
        }
        .background(Color("White"))
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .cornerRadius(5)
        .shadow(color: .gray.opacity(0.1), radius: 1, x: 0, y: 5)
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
