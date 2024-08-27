import Foundation

class AccountManager {
    var currentUser: User
    var allowedUsers: [String]
    
    init() {
        currentUser = .none
        allowedUsers = []
    }
    
    func signUp(username: String) -> Bool {
        guard 3 <= username.count && username.count <= 64 else {
            return false
        }
        if isRegistered(username) {
            return false
        }
        allowedUsers.append(username)
        return true
    }
    
    func signIn(username: String) -> Bool {
        guard isRegistered(username) else {
            return false
        }
        currentUser = .isAuthenticated(username: username)
        return true
    }
    
    func signOut() -> Bool {
        currentUser = .none
        return true
    }
    
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
