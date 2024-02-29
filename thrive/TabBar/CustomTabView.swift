import SwiftUI

struct TabBarView1: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        ZStack {
            VStack {
                Group {
                    switch selectedTab {
                    case .home:
                      HomeScreenView()
                    case .addHabit:
                        AddHabitView(HabitsClass: Habits())
                    case .settings:
                      SettingsView()
                    }
                }
    
                Spacer()
    
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .shadow(color: .gray.opacity(0.4), radius: 20, x: 0, y: 20)
    
                    TabsLayoutView(selectedTab: $selectedTab)
    
                }
                .frame(height: 70, alignment: .center)
                .padding(.horizontal, UIScreen.main.bounds.width * 0.08)
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .background(Color("color1"))
        }
    }
  }

fileprivate struct TabsLayoutView: View {
    @Binding var selectedTab: Tab
    @Namespace var namespace
    
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            
            ForEach(Tab.allCases) { tab in
                TabButton(tab: tab, selectedTab: $selectedTab, namespace: namespace)
                    .frame(width: 65, height: 65, alignment: .center)
                
                Spacer(minLength: 0)
            }
        }
    }
    
    private struct TabButton: View {
        let tab: Tab
        @Binding var selectedTab: Tab
        var namespace: Namespace.ID
        
        var body: some View {
            Button {
                withAnimation {
                    selectedTab = tab
                }
            } label: {
                ZStack {
                    if isSelected {
                        Circle()
                            .shadow(radius: 10)
                            .background {
                                Circle()
//                                    .stroke(lineWidth: 20)
//                                    .foregroundColor(tab.color)
                            }
//                            .foregroundColor(tab.color)
                            .foregroundColor(Color("color1"))
                            .offset(y: -16)
                            .matchedGeometryEffect(id: "Selected Tab", in: namespace)
                            .animation(.spring(), value: selectedTab)
                       
                    }
                    
                    Image(systemName: tab.icon)
                        .font(.system(size: 23, weight: .semibold, design: .rounded))
                        .foregroundColor(isSelected ? .white : .gray)
                        .scaleEffect(isSelected ? 1 : 0.8)
                        .offset(y: isSelected ? -16 : 0)
                        .animation(isSelected ? .spring(response: 0.5, dampingFraction: 0.3, blendDuration: 1) : .spring(), value: selectedTab)
                }
            }
            .buttonStyle(.plain)
        }
        
        private var isSelected: Bool {
            selectedTab == tab
        }
    }
}

struct TabBarView1_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView1()
            .padding(.horizontal)
    }
}


