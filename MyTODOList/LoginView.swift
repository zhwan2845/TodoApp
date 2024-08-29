import SwiftUI

struct LoginView: View {
    @State var usernameInput: String = ""
    @Binding var mgr: AccountManager
    var body: some View {
        VStack {
            Text("TaskMaster")
                .padding()
                .font(.largeTitle)
                .bold()
            
            HStack {
                TextField("사용자 이름", text: $usernameInput)
                    .padding()
                    .background(.gray.opacity(0.1))
                
                Button("로그인") {
                    _ = mgr.signIn(username: usernameInput)
                }
                .padding()
                .background(.yellow)
                .foregroundColor(.black)
            }
            .padding()
            
            Button("만약 TaskMaster가 처음이라면?") {
                _ = mgr.signUp(username: usernameInput)
            }
            .foregroundColor(.black)
            
            Spacer()
        }
    }
}
