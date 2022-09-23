

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date

    // Month update on arrow button clicks
    @State var currentMonth: Int = 0
    var body: some View {
        VStack(spacing: 35) {

            //Days
            let days: [String] =
            ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

            HStack (spacing: 20){

                VStack (alignment: .leading, spacing: 10) {
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)

                    Text(extraDate()[1])
                        .font(.title.bold())
                }

                Spacer(minLength: 0)

                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }

                Button {
                    withAnimation {
                        currentMonth -= 1
                    }

                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }

            }
            .padding(.horizontal)

            //Day View
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in

                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }

            // Dates
            // Lazy Grid
            let  columns = Array(repeating: GridItem(.flexible()), count: 7)

            LazyVGrid(columns: columns, spacing: 15) {

                ForEach(extractDate()) { value in
                    CardView(value: value)
                }
            }
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
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }) {
                    Text("\(value.day)")
                        .font(.title3.bold())

                    Spacer()

                    Circle()
                        .fill(Color("Pink"))
                        .frame(width: 8, height: 8)
                }
                else  {
                    Text("\(value.day)")
                        .font(.title3.bold())

                    Spacer()
                }
            }
        }
        .padding(.vertical, 8)
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
