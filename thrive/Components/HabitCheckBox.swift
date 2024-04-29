//
//  HabitCheckBox.swift
//  thrive
//
//  Created on 2/24/24.
//

import SwiftUI

struct HabitCheckBox: View {
    @Binding var habit: Habit
    
    var body: some View {
        Button(action: {
            habit.toggleCompletion()
        }) {
            HStack {
                Text("\(habit.emoji ?? "⭐️")")
                    .font(.system(size: 35))
                    .foregroundColor(Color(.white))
                    .padding(10)
                    .background(Color("taupe"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                

                
         

                Text("\(habit.name)")
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundStyle(Color("taupe4"))
                    .padding(.leading, 10)
                
                Spacer()
                
                if habit.isChecked {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color("taupe3"))
                        .padding(10)
//                        .background(Color.white)
//                        .clipShape(Circle())
                } else {
                    Image(systemName: "plus")
                        .foregroundColor(Color("taupe4"))
                        .padding(10)
//                        .background(Color.white)
//                        .clipShape(Circle())
                }
            }
            .padding(.trailing, 20)
            .padding(.leading,10)
            .padding(.vertical, 15)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    HStack {
        HabitCheckBox(habit: .constant(Habit.MOCK_HABITS[0]))
            .padding(.horizontal)
    }
    .background(.blue)
}
