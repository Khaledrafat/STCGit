//
//  ForkedUser.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import Foundation

struct ForkedUser: Codable {
    let description: String?
    let name: String?
}

typealias ForkedUsers = [ForkedUser]
