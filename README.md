# STCGit

## Features

### 1. **User List Screen**
- Displays a list of GitHub users.
- Tap on a user to navigate to their repositories.

### 2. **Repository Details Screen**
- Lists repositories for the selected user.
- Each repository displays:
  - **Name**: The name of the repository.
  - **License**: The type of license (if available).
  - **Description**: A brief overview of the repository.

### 3. **Forked Users Screen**
- Shows a list of users who have forked a specific repository.

## Technologies Used

- **Language**: SwiftUI + UIkit
- **Architecture**: MVVM + Clean Architecture .
- **Networking**: URLSession with abstraction for network requests.
- **Decoding**: JSONDecoder for parsing API responses.
- **Unit Tests**: XCTest framework for testing components.
- **Dependency Injection**: For flexibility in swapping services during testing or runtime.

## Git Note
- the main brach has only the squash merge commit and all history can be found in development bransh.

## Key Note
- please note that for the app to run u should insert your github personal token key in **Presentation/Helper/Constants** File
