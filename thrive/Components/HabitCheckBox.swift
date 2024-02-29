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
                if habit.isChecked {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color("color1"))
                        .padding(10)
                        .background(Color.white)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "questionmark")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color("color1"))
                        .clipShape(Circle())
                }
                
                Spacer()

                Text("\(habit.name)")
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundStyle(habit.isChecked ? .white : Color("color1"))
                    .padding(.leading, 10)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 13)
            .background(habit.isChecked ? Color("color1") : .white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    HabitCheckBox(habit: .constant(Habit.MOCK_HABITS[0]))
}
