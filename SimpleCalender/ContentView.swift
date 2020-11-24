//
//  ContentView.swift
//  SimpleCalender
//
//  Created by Aji_sahputra on 23/11/20.
//

import SwiftUI

struct Month : Hashable {
  var month : String
  var days : Int
  var firstDayIndex : Int
}

struct Day : Equatable {
  var day : Int
  var month : String
}

var months : [Month] = [
  Month(month: "Januari", days: 31, firstDayIndex: 5),
  Month(month: "Februari", days: 28, firstDayIndex: 1),
  Month(month: "Maret", days: 31, firstDayIndex: 1),
  Month(month: "April", days: 30, firstDayIndex: 4),
  Month(month: "Mei", days: 31, firstDayIndex: 6),
  Month(month: "Juni", days: 30, firstDayIndex: 2),
  Month(month: "Juli", days: 31, firstDayIndex: 4),
  Month(month: "Agustus", days: 31, firstDayIndex: 7),
  Month(month: "September", days: 30, firstDayIndex: 3),
  Month(month: "Oktober", days: 31, firstDayIndex: 5),
  Month(month: "November", days: 30, firstDayIndex: 1),
  Month(month: "Desember", days: 31, firstDayIndex: 3)
]

var days : [String] = ["S", "S", "R", "K", "J", "S", "M"]

struct ContentView: View {
  
    var body: some View {
      NavigationView {
        VStack {
          HStack (spacing: 20.5) {
            ForEach(days, id: \.self) {day in
              Text(day)
                .bold()
                .frame(minWidth: 25, minHeight: 25)
            }
          }.border(Color.blue, width: 1)
          ScrollView {
            MonthView(selectedDay: nil)
              .padding()
          }
        }.padding()
          .navigationBarTitleDisplayMode(.inline)
          .toolbar {
            ToolbarItem(placement: .principal) {
              VStack (spacing: 3)  {
                Text("Kalender").font(.headline)
                    Text("2021").font(.subheadline)
                      .bold()
                }
              .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
          }
      }
   }
}


struct MonthView : View {
  @State var selectedDay : Day?
  
  var body: some View {
    VStack {
      ForEach(months, id: \.self) { month in
        Text ("\(month.month)")
          .bold()
        LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
          ForEach(1...month.days + month.firstDayIndex - 1, id: \.self) { day in
            if day >= month.firstDayIndex {
              Text("\(day - (month.firstDayIndex - 1))")
                .frame(minWidth: 25, minHeight: 25)
                .onTapGesture {
                  self.selectedDay = Day(day: day, month: month.month)
                }
                .background(Day(day: day, month: month.month) ==
                              self.selectedDay ? Color.blue: Color.clear)
            }else {
              Spacer()
            }
          }
        }
        Divider()
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
