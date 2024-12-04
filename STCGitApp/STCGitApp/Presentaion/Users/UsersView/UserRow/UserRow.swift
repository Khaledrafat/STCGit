//
//  UserRow.swift
//  Github-App
//
//  Created by Khaled on 02/12/2024.
//

import SwiftUI

struct UserRow: View {
    
    var user: User?
    var body: some View {
        VStack {
            HStack(spacing: 24) {
                Spacer()
                    .frame(width: 60, height: 60)
                
                Text((user?.login).defaultValue)
                
                Spacer()
            }
            // The Response had no count for repos and follower so i used random numbers
            HStack {
                Text("\(Int.random(in: 0..<200)) Followers")
                Spacer()
                Text("\(Int.random(in: 0..<200)) Repos")
            }
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow()
    }
}