//
//  ForkedUserSwiftUICell.swift
//  STCGitApp
//
//  Created by Khaled on 04/12/2024.
//

import SwiftUI

struct ForkedUserSwiftUICell: View {
    
    let name: String
    let desc: String
    let width: CGFloat
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.5)
            VStack {
                Spacer()
                Text("Name: \(name)")
                Spacer()
                Text(desc)
                Spacer()
            }
        }
        .frame(width: width, height: 92)
        .cornerRadius(12)
    }
}

struct ForkedUserSwiftUICell_Previews: PreviewProvider {
    static var previews: some View {
        ForkedUserSwiftUICell(name: "", desc: "", width: 100)
    }
}
