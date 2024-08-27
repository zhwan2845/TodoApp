import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    var body: some View {
        VStack {
            Text("TaskMaster")
                .padding()
                .font(.largeTitle)
                .bold()
            
            HStack {
                TextField("사용자 이름", text: $username)
                    .padding()
                    .background(.gray.opacity(0.1))
                
                Button("로그인") {
                    
                }
                .padding()
                .background(.yellow)
                .foregroundColor(.black)
            }
            .padding()
            
            Button("만약 TaskMaster가 처음이라면?") {
                
            }
            .foregroundColor(.black)
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
