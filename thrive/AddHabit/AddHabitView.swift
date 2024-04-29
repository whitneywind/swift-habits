//
//  AddHabitView.swift
//  Created on 2/23/24.
//

import SwiftUI

struct AddHabitView: View {
    @State private var habitName = ""
    @State private var details = ""
    @State private var emoji = "📚"
    @ObservedObject var HabitsClass: Habits
    
    var body: some View {
        VStack {
            Spacer()
            Text("Add a new habit")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color("taupe4"))
                .padding(.bottom)
            
            VStack {
                
                TextField("Habit name", text: $habitName)
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.title2)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("taupe2"), lineWidth: 4)
                    )
                    .frame(width: 300)
                
//                select emoji
//                TextField("Icon", text: $emoji)
//                    .multilineTextAlignment(.center)
//                    .padding()
//                    .font(.title2)
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color("color5"), lineWidth: 4)
//                    )
//                    .frame(width: 100)
                VStack(spacing: 0) {
                    Text(emoji)
                        .font(.system(size: 80))
                    
                    EmojiPickerView(selectedEmoji: $emoji)
                }
                
                
//                TextEditor(text: $details)
//                    .frame(minWidth: 300, maxWidth: 300, minHeight: 100, maxHeight: 200)
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color("color5"), lineWidth: 4)
//                    )
//                    .padding(.horizontal)
//                    .padding(.bottom)
                
                Button(action: {
                    HabitsClass.addHabit(name: habitName, details: details, emoji: emoji)
                    habitName = ""
                    details = ""
                }) {
                    Text("Create")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 50)
                .padding(.vertical)
                .background(Color("taupe3"))
                .cornerRadius(10)
                
            }
            
            Spacer()
            Spacer()
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color("taupe"))
    }
}

let habitsClassInstance = Habits()

#Preview {
    AddHabitView(HabitsClass: habitsClassInstance)
}



struct EmojiPickerView: View {
    @Binding var selectedEmoji: String
    @State private var isEmojiPickerPresented = false
    
    var body: some View {
        VStack {
            Button(action: {
                isEmojiPickerPresented = true
            }) {
                Text("Select Emoji")
            }
            .sheet(isPresented: $isEmojiPickerPresented, content: {
                EmojiGrid(selectedEmoji: $selectedEmoji, isEmojiPickerPresented: $isEmojiPickerPresented)
            })
        }
        .padding()
    }
}

struct EmojiGrid: View {
    @Binding var selectedEmoji: String
    @Binding var isEmojiPickerPresented: Bool
    
    let emojis = ["🧘‍♂️", "🧗‍♂️", "🍵", "🏃‍♂️", "💧", "🚴‍♂️", "🛌", "📝", "💼", "🚭", "🥗", "🏋️‍♂️", "🎸", "🎮", "📚", "⚽️", "🎨", "💌", "🎥", "💦", "🔒", "🔨", "💊", "🚦", "🗺️", "💟", "💕", "🥇", "🧩", "🎉", "⭐️", "🌟", "✨", "💫", "💛"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 5), spacing: 10) {
                    ForEach(emojis, id: \.self) { emoji in
                        Button(action: {
                            selectedEmoji = emoji
                            isEmojiPickerPresented = false
                        }) {
                            Text(emoji)
                                .font(.largeTitle)
                        }
                        .buttonStyle(EmojiButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("Select Emoji")
            .navigationBarItems(trailing: Button("Close") {
                isEmojiPickerPresented = false
            })
        }
    }
}

struct EmojiButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.primary)
            .padding()
            .background(Color.secondary.opacity(configuration.isPressed ? 0.5 : 0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
