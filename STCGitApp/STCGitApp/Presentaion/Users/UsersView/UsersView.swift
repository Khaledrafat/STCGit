//
//  UsersView.swift
//  Github-App
//
//  Created by Khaled on 02/12/2024.
//

import SwiftUI

struct UsersView<genViewModel: UsersViewModel>: View {
    
    @State private var showUIKitScreen = false
    @State private var selectedIndex = 0
    @State private var show = false
    @StateObject var viewModel: genViewModel
    
    //MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                Text("Git Users List")
                    .foregroundColor(Color.black)
                
                contentView
                    .disabled(viewModel.isLoading)
            }
            
            if viewModel.isLoading {
                Loader()
            }
            
            AlertView(
                isPresented: $show,
                title: "Error",
                message: viewModel.errorMessage) { }
        }
        .onChange(of: viewModel.showError) { newValue in
            show = newValue
        }
    }
    
    //MARK: - ContentView
    var contentView: some View {
        List {
            ForEach(0..<viewModel.items.count, id: \.self) { index in
                UserRow(user: viewModel.items[index]) {
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

//MARK: - Preview
struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(
            viewModel: DefaultUsersViewModel(
                usersUseCases: DefaultUsersUseCases(
                    usersRepo: DefaultUsersRepo(
                        network: DefaultNetworkService()
                    )
                )
            )
        )
    }
}
