//
//  AddHabitView.swift
//  Created on 2/23/24.
//

import SwiftUI

struct AddHabitView: View {
    @State private var habitName = ""
    @State private var details = ""
    @ObservedObject var HabitsClass: Habits
    
    var body: some View {
        VStack {
            Spacer()
            Text("Add a new habit")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)
                .padding(.bottom)
            
            VStack {
                
                TextField("Habit name", text: $habitName)
                    .padding()
                    .font(.title2)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("color5"), lineWidth: 4)
                    )
                    .frame(width: 300)
                    .padding(.bottom)
                
                
                TextEditor(text: $details)
                    .frame(minWidth: 300, maxWidth: 300, minHeight: 100, maxHeight: 200)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("color5"), lineWidth: 4)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                
                Button(action: {
                    HabitsClass.addHabit(name: habitName, details: details)
                    habitName = ""
                    details = ""
                }) {
                    Text("Create")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 50)
                .padding(.vertical)
                .background(Color("color5"))
                .cornerRadius(10)
                
            }
            
            Spacer()
            Spacer()
            Spacer()
            
        }
        .background(Color("color1"))
    }
}

let habitsClassInstance = Habits()

#Preview {
    AddHabitView(HabitsClass: habitsClassInstance)
}
