//
//  SettingsView.swift
//  thrive
//
//  Created by Whitney Gould on 2/23/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("Drawing")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 240)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("taupe"))


//            ScrollView {
//                LazyVStack(spacing: 12) {
//                    ForEach(0..<3)  {_ in
//
//                            HStack {
//                                Text("some kind of setting")
//                                
//                                VStack(alignment: .leading) {
//                                    Text("more settings")
//                                }
//                                .font(.footnote)
//                                
//                                Spacer()
//                            }
//                            .foregroundStyle(.black)
//                            .padding(.horizontal)
//                        }
//
//                }
//                .padding(.top, 8)
//            }

            .navigationTitle("Garden")
            .navigationBarTitleDisplayMode(.inline)
            
        }

    }
}

#Preview {
    SettingsView()
}
