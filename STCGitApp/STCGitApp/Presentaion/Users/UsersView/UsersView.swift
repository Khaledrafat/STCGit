//
//  ContentView.swift
//  Github-App
//
//  Created by Khaled on 02/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: DefaultUsersViewModel = DefaultUsersViewModel(usersUseCases: DefaultUsersUseCases(usersRepo: DefaultUsersRepo(network: DefaultNetworkService())))
    
    //MARK: - Body
    var body: some View {
        List {
            ForEach(0..<viewModel.items.count, id: \.self) { index in
                UserRow(user: viewModel.items[index])
                    .onTapGesture {
                        
                    }
            }
        }
        .onAppear {
            viewModel.viewdidload()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
