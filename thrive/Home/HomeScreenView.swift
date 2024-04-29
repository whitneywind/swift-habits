//
//  HomeScreenView.swift
//  thrive
//
//  Created on 2/23/24.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var HabitClass = Habits()
    @ObservedObject var todaysDate = TodaysDate()
    @State private var scrollToIndex = 0


    var body: some View {
        VStack {
                VStack {
                    HStack {
                        Text(todaysDate.month)
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("taupe4"))
                    }
                    
                    // date selection scroll
                    ScrollViewReader { scrollView in
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(-5...5, id: \.self) { index in
                                    let date = Calendar.current.date(byAdding: .day, value: index, to: todaysDate.currentDate)!
                                    
                                    VStack {
                                        Text(todaysDate.getShortenedWeekday(date: date))
                                            .foregroundColor(Color("taupe4"))
                                        
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(.white)
                                                .frame(width: 50, height: 50)
                                                .padding(.horizontal, 8)
                                            
                                            Text(todaysDate.getDayOfMonth(date: date))
                                                .fontWeight(.bold)
                                                .font(.title2)
                                                .foregroundColor(Color("taupe4"))
                                                .offset(x: 0, y: 0)
                                        }
                                    }
                                    .onTapGesture {
                                        withAnimation {
                                            scrollView.scrollTo(index, anchor: .center) // Scroll to clicked item with animation
                                        }
                                    }
                                }
                            }
                        }
                        .onAppear {
                            scrollView.scrollTo(scrollToIndex, anchor: .center)
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.height / 6)
                .padding(.bottom)
            
            Text("Habits")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("taupe4"))
            
            ZStack {
                VStack {
                    ScrollView(showsIndicators: false) {
                        ForEach(HabitClass.habitData) { habit in
                            HabitCheckBox(habit: self.binding(for: habit))
                                .padding(.horizontal, 30)
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
        .padding(.bottom)
        .background(Color("taupe"))
        
    }
    
    private func binding(for habit: Habit) -> Binding<Habit> {
        guard let habitIndex = HabitClass.habitData.firstIndex(where: { $0.id == habit.id }) else {
             fatalError("Cannot find habit in array")
         }
         return Binding<Habit>(
            get: { self.HabitClass.habitData[habitIndex] },
             set: { newValue in
                 self.HabitClass.habitData[habitIndex] = newValue
                 self.sortHabits()
             }
         )
     }
    
    private func sortHabits() {
        HabitClass.habitData.sort { !$0.isChecked && $1.isChecked }
    }
    

}



#Preview {
    HomeScreenView()
}
