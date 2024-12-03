//
//  UsersView.swift
//  Github-App
//
//  Created by Khaled on 02/12/2024.
//

import SwiftUI

struct UsersView: View {
    
    @State private var showUIKitScreen = false
    @State private var selectedIndex = 0
    @StateObject var viewModel: DefaultUsersViewModel = DefaultUsersViewModel(usersUseCases: DefaultUsersUseCases(usersRepo: DefaultUsersRepo(network: DefaultNetworkService())))
    
    //MARK: - Body
    var body: some View {
        List {
            ForEach(0..<viewModel.items.count, id: \.self) { index in
                UserRow(user: viewModel.items[index])
                    .onTapGesture {
                        selectedIndex = index
                        showUIKitScreen.toggle()
                    }
            }
        }
        .onAppear {
            viewModel.viewdidload()
        }
        .fullScreenCover(isPresented: $showUIKitScreen) {
            UIKitViewControllerWrapper(user: viewModel.items[selectedIndex])
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
