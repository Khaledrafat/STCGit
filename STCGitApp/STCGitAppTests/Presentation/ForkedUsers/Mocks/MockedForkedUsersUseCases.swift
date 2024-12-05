//
//  MockedForkedUsersUseCases.swift
//  STCGitAppTests
//
//  Created by Khaled on 05/12/2024.
//

import Foundation
@testable import STCGitApp

class MockedFailedForkedUsersUseCases: ForkedUsersUseCases {
    func fetchForkedUsers(query: ForkedUsersQuery, completion: @escaping (Result<ForkedUsers, Error>) -> Void) {
        let forkedUsers = [ForkedUser(description: "Desc 1", name: "Sam"),
                           ForkedUser(description: "Desc 2", name: "Liam"),
                           ForkedUser(description: "Desc 3", name: "Amy"),
                           ForkedUser(description: "Desc 4", name: "Leny")]
        completion(.success(forkedUsers))
    }
}


class MockedSuccessForkedUsersUseCases: ForkedUsersUseCases {
    func fetchForkedUsers(query: ForkedUsersQuery, completion: @escaping (Result<ForkedUsers, Error>) -> Void) {
        completion(.failure(NetworkError.urlGeneration))
    }
}

class MockedData {
    func getUserRepo() -> GitRepo {
        let repoOwner = Owner(login: "Sam", id: nil, nodeID: nil, avatarURL: nil, gravatarID: nil, url: nil, htmlURL: nil, followersURL: nil, followingURL: nil, gistsURL: nil, starredURL: nil, subscriptionsURL: nil, organizationsURL: nil, reposURL: nil, eventsURL: nil, receivedEventsURL: nil, type: nil, userViewType: nil, siteAdmin: nil)
        
        let repo = GitRepo(id: 0, nodeID: nil, name: "Alex", fullName: nil, ssPrivate: nil, owner: repoOwner, htmlURL: nil, description: nil, fork: nil, url: nil, forksURL: nil, keysURL: nil, collaboratorsURL: nil, teamsURL: nil, hooksURL: nil, issueEventsURL: nil, eventsURL: nil, assigneesURL: nil, branchesURL: nil, tagsURL: nil, blobsURL: nil, gitTagsURL: nil, gitRefsURL: nil, treesURL: nil, statusesURL: nil, languagesURL: nil, stargazersURL: nil, contributorsURL: nil, subscribersURL: nil, subscriptionURL: nil, commitsURL: nil, gitCommitsURL: nil, commentsURL: nil, issueCommentURL: nil, contentsURL: nil, compareURL: nil, mergesURL: nil, archiveURL: nil, downloadsURL: nil, issuesURL: nil, pullsURL: nil, milestonesURL: nil, notificationsURL: nil, labelsURL: nil, releasesURL: nil, deploymentsURL: nil, createdAt: nil, updatedAt: nil, pushedAt: nil, gitURL: nil, sshURL: nil, cloneURL: nil, svnURL: nil, homepage: nil, size: nil, stargazersCount: nil, watchersCount: nil, language: nil, hasIssues: nil, hasProjects: nil, hasDownloads: nil, hasWiki: nil, hasPages: nil, hasDiscussions: nil, forksCount: nil, mirrorURL: nil, archived: nil, disabled: nil, openIssuesCount: nil, license: nil, allowForking: nil, isTemplate: nil, webCommitSignoffRequired: nil, visibility: nil, forks: nil, openIssues: nil, watchers: nil, defaultBranch: nil)
        
        return repo
    }
}
