//
//  GitRepoMock.swift
//  STCGitAppTests
//
//  Created by Khaled on 05/12/2024.
//

import Foundation
@testable import STCGitApp

extension GitRepo {
    init(
        id: Int? = 1,
        nodeID: String? = "mockNodeID",
        name: String? = "mockRepoName",
        fullName: String? = "mockUser/mockRepoName",
        ssPrivate: Bool? = false,
        owner: Owner? = Owner.mock(),
        htmlURL: String? = "https://github.com/mockUser/mockRepoName",
        description: String? = "This is a mock repository",
        fork: Bool? = false,
        url: String? = "https://api.github.com/repos/mockUser/mockRepoName",
        forksURL: String? = "https://api.github.com/repos/mockUser/mockRepoName/forks",
        keysURL: String? = nil,
        collaboratorsURL: String? = nil,
        teamsURL: String? = nil,
        hooksURL: String? = nil,
        issueEventsURL: String? = nil,
        eventsURL: String? = nil,
        assigneesURL: String? = nil,
        branchesURL: String? = nil,
        tagsURL: String? = nil,
        blobsURL: String? = nil,
        gitTagsURL: String? = nil,
        gitRefsURL: String? = nil,
        treesURL: String? = nil,
        statusesURL: String? = nil,
        languagesURL: String? = nil,
        stargazersURL: String? = nil,
        contributorsURL: String? = nil,
        subscribersURL: String? = nil,
        subscriptionURL: String? = nil,
        commitsURL: String? = nil,
        gitCommitsURL: String? = nil,
        commentsURL: String? = nil,
        issueCommentURL: String? = nil,
        contentsURL: String? = nil,
        compareURL: String? = nil,
        mergesURL: String? = nil,
        archiveURL: String? = nil,
        downloadsURL: String? = nil,
        issuesURL: String? = nil,
        pullsURL: String? = nil,
        milestonesURL: String? = nil,
        notificationsURL: String? = nil,
        labelsURL: String? = nil,
        releasesURL: String? = nil,
        deploymentsURL: String? = nil,
        createdAt: String? = nil,
        updatedAt: String? = nil,
        pushedAt: String? = nil,
        gitURL: String? = nil,
        sshURL: String? = nil,
        cloneURL: String? = nil,
        svnURL: String? = nil,
        homepage: String? = nil,
        size: Int? = nil,
        stargazersCount: Int? = nil,
        watchersCount: Int? = nil,
        language: String? = nil,
        hasIssues: Bool? = nil,
        hasProjects: Bool? = nil,
        hasDownloads: Bool? = nil,
        hasWiki: Bool? = nil,
        hasPages: Bool? = nil,
        hasDiscussions: Bool? = nil,
        forksCount: Int? = nil,
        mirrorURL: String? = nil,
        archived: Bool? = nil,
        disabled: Bool? = nil,
        openIssuesCount: Int? = nil,
        license: License? = nil,
        allowForking: Bool? = nil,
        isTemplate: Bool? = nil,
        webCommitSignoffRequired: Bool? = nil,
        visibility: String? = nil,
        forks: Int? = nil,
        openIssues: Int? = nil
    ) {
        self.id = id
        self.nodeID = nodeID
        self.name = name
        self.fullName = fullName
        self.ssPrivate = ssPrivate
        self.owner = owner
        self.htmlURL = htmlURL
        self.description = description
        self.fork = fork
        self.url = url
        self.forksURL = forksURL
        self.keysURL = keysURL
        self.collaboratorsURL = collaboratorsURL
        self.teamsURL = teamsURL
        self.hooksURL = hooksURL
        self.issueEventsURL = issueEventsURL
        self.eventsURL = eventsURL
        self.assigneesURL = assigneesURL
        self.branchesURL = branchesURL
        self.tagsURL = tagsURL
        self.blobsURL = blobsURL
        self.gitTagsURL = gitTagsURL
        self.gitRefsURL = gitRefsURL
        self.treesURL = treesURL
        self.statusesURL = statusesURL
        self.languagesURL = languagesURL
        self.stargazersURL = stargazersURL
        self.contributorsURL = contributorsURL
        self.subscribersURL = subscribersURL
        self.subscriptionURL = subscriptionURL
        self.commitsURL = commitsURL
        self.gitCommitsURL = gitCommitsURL
        self.commentsURL = commentsURL
        self.issueCommentURL = issueCommentURL
        self.contentsURL = contentsURL
        self.compareURL = compareURL
        self.mergesURL = mergesURL
        self.archiveURL = archiveURL
        self.downloadsURL = downloadsURL
        self.issuesURL = issuesURL
        self.pullsURL = pullsURL
        self.milestonesURL = milestonesURL
        self.notificationsURL = notificationsURL
        self.labelsURL = labelsURL
        self.releasesURL = releasesURL
        self.deploymentsURL = deploymentsURL
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.pushedAt = pushedAt
        self.gitURL = gitURL
        self.sshURL = sshURL
        self.cloneURL = cloneURL
        self.svnURL = svnURL
        self.homepage = homepage
        self.size = size
        self.stargazersCount = stargazersCount
        self.watchersCount = watchersCount
        self.language = language
        self.hasIssues = hasIssues
        self.hasProjects = hasProjects
        self.hasDownloads = hasDownloads
        self.hasWiki = hasWiki
        self.hasPages = hasPages
        self.hasDiscussions = hasDiscussions
        self.forksCount = forksCount
        self.mirrorURL = mirrorURL
        self.archived = archived
        self.disabled = disabled
        self.openIssuesCount = openIssuesCount
        self.license = license
        self.allowForking = allowForking
        self.isTemplate = isTemplate
        self.webCommitSignoffRequired = webCommitSignoffRequired
        self.visibility = visibility
        self.forks = forks
        self.openIssues = openIssues
        self.watchers = nil
        self.defaultBranch = nil
    }
}


extension Owner {
    static func mock(
        login: String? = "mockUser",
        id: Int? = 1,
        nodeID: String? = "mockNodeID",
        avatarURL: String? = "https://avatars.githubusercontent.com/u/1?v=4",
        gravatarID: String? = "",
        url: String? = "https://api.github.com/users/mockUser",
        htmlURL: String? = "https://github.com/mockUser",
        followersURL: String? = "https://api.github.com/users/mockUser/followers",
        followingURL: String? = "https://api.github.com/users/mockUser/following{/other_user}",
        gistsURL: String? = "https://api.github.com/users/mockUser/gists{/gist_id}",
        starredURL: String? = "https://api.github.com/users/mockUser/starred{/owner}{/repo}",
        subscriptionsURL: String? = "https://api.github.com/users/mockUser/subscriptions",
        organizationsURL: String? = "https://api.github.com/users/mockUser/orgs",
        reposURL: String? = "https://api.github.com/users/mockUser/repos",
        eventsURL: String? = "https://api.github.com/users/mockUser/events{/privacy}",
        receivedEventsURL: String? = "https://api.github.com/users/mockUser/received_events",
        type: String? = "User",
        userViewType: String? = nil,
        siteAdmin: Bool? = false
    ) -> Owner {
        return Owner(
            login: login,
            id: id,
            nodeID: nodeID,
            avatarURL: avatarURL,
            gravatarID: gravatarID,
            url: url,
            htmlURL: htmlURL,
            followersURL: followersURL,
            followingURL: followingURL,
            gistsURL: gistsURL,
            starredURL: starredURL,
            subscriptionsURL: subscriptionsURL,
            organizationsURL: organizationsURL,
            reposURL: reposURL,
            eventsURL: eventsURL,
            receivedEventsURL: receivedEventsURL,
            type: type,
            userViewType: userViewType,
            siteAdmin: siteAdmin
        )
    }
}
