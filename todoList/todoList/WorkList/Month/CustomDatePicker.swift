import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    let date = Date()

    // Month update on arrow button clicks
    @State var currentMonth: Int = 0
    var body: some View {
        VStack(spacing: 15) {

            //Days
            let days: [String] =
            ["S", "M", "T", "W", "T", "F", "S"]

            //Day View
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in

                    Text(day)
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundColor(Color("Gray"))
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)

            // Dates
            // Lazy Grid
            let  columns = Array(repeating: GridItem(.flexible()), count: 7)

            LazyVGrid(columns: columns, spacing: 0) {

                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color("Red"))
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
//            withAnimation {
//                currentMonth += 1
//            }
            .padding(.horizontal)
            .background(.white)
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .cornerRadius(5)
            .shadow(color: .gray.opacity(0.1), radius: 1, x: 0, y: 5)

        }
        .onChange(of: currentMonth) { newValue in
            currentDate = getCurrentMonth()
        }
    }

    @ViewBuilder
    func CardView(value: DateValue) -> some  View {

        VStack {
            if value.day != -1 {
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)

                    Spacer()

                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : Color("Red"))
                        .frame(width: 5, height: 5)
                }
                else  {
                    Text("\(value.day)")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)

                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }

    //cheking dates ...

    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current

        return calendar.isDate(date1, inSameDayAs: date2)

    }

    func extraDate() ->[String] {
        let fornatter = DateFormatter()
        fornatter.dateFormat = "YYYY MMMM"

        let date =  fornatter.string(from: currentDate)

        return date.components(separatedBy: " ")
    }

    func getCurrentMonth()->Date {
        let calendar = Calendar.current

        //Getting Current Month Date...
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }

    func extractDate()-> [DateValue]{

        let calendar = Calendar.current

        //Getting Current Month Date...
        let currentMonth = getCurrentMonth()

        var days =  currentMonth.getAllDates().compactMap { date -> DateValue in
            //getting day

            let day = calendar.component(.day, from: date)

            return DateValue(day: day, date: date)
        }

        let  firstWeek = calendar.component(.weekday, from: days.first?.date ?? Date())

        for _ in 0..<firstWeek - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }

        return days
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        WorkListMonth_View()
    }
}

extension Date {
    func getAllDates() -> [Date] {

        let calendar = Calendar.current

        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!

        let range = calendar.range(of: .day, in: .month, for: startDate)!

        //getting date

        return range.compactMap { day -> Date in

            return calendar.date(byAdding: .day, value: day - 1 , to: startDate)!
        }
    }
}

struct EverydayTask: View {
    @Binding var currentDate: Date
    var body: some View {
        VStack(spacing: 15) {

            if let task = tasks.first(where: { task in
                return isSameDay(date1: task.taskDate, date2: currentDate)
            }) {
                WorkListToday_View()
            }
            else {
                Text("No Task Found")
                    .font(.custom("Roboto-Medium", size: 14))
                    .foregroundColor(Color("Black"))
            }
        }
        .padding()
    }

    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current

        return calendar.isDate(date1, inSameDayAs: date2)

    }
}
