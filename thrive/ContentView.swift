//
//  ContentView.swift
//  thrive
//
//  Created on 2/23/24.
//

import SwiftUI

struct ContentView: View {
    var currentUser: User? = User.MOCK_USERS[0]
    
    var body: some View {
        Group {
            if currentUser == nil {
                GettingStartedView()
            } else {
                TabBarView1()
            }
        }
    }
}

#Preview {
    ContentView()
}
