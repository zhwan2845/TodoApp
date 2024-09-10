import SwiftUI

struct UsernameUpdateView: View {
    @Binding var mgr: AccountManager
    @State var textInput: String = ""
    
    var body: some View {
        VStack {
            TextField(mgr.getUsername(), text: $textInput)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            
            Spacer()
            Button("저장하기") {
                mgr.updateUsername(username: textInput)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.black)
        }
    }
}


