//
//  SignUpView.swift
//  thrive
//
//  Created on 2/23/24.
//

import SwiftUI

struct SignUpView: View {
    // double check if user data found - account or not
    @State var user: User
    
    var body: some View {
        Text("this is the signup view: i'm \(user.username)")
    }
}

#Preview {
    SignUpView(user: User.MOCK_USERS[0])
}
