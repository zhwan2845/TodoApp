import Foundation

@Observable
class AccountManager {
    var currentUser: User
    var allowedUsers: [String]
    
    init() {
        currentUser = .none
        allowedUsers = []
    }
    
    func getUsername() -> String {
        switch currentUser {
        case .isAuthenticated(let username):
            return username
        case .none:
            return "Error"
        }
    }
    
    func updateUsername(username: String) {
        // TODO: username length check
        currentUser = .isAuthenticated(username: username)
    }
    
    func signUp(username: String) -> Bool {
        guard 3 <= username.count && username.count <= 64 else {
            return false
        }
        if isRegistered(username) {
            return false
        }
        allowedUsers.append(username)
        currentUser = .isAuthenticated(username: username)
        return true
    }
    
    func signIn(username: String) -> Bool {
        guard isRegistered(username) else {
            return false
        }
        currentUser = .isAuthenticated(username: username)
        return true
    }
    
    // 로그아웃
    func signOut() -> Bool {
        currentUser = .none
        return true
    }
    
    // 계정 삭제
    func deleteAccount(username: String) -> Bool {
        allowedUsers.removeAll(where: { $0 == username })
        currentUser = .none
        return true
    }
    
    private func isRegistered(_ username: String) -> Bool {
        for allowedUser in allowedUsers where username == allowedUser {
            return true
        }
        return false
    }
}
