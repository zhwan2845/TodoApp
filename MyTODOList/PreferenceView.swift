import SwiftUI

struct PreferenceView: View {
    @Binding var mgr: AccountManager
    
    var body: some View {
        VStack {
            Text(mgr.getUsername())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .font(.largeTitle)
                .bold()
            
            Text("계정")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .font(.headline)
            
            List {
                NavigationLink(destination: UsernameUpdateView(mgr: $mgr)) {
                    Text("이름")
                }
                
                
                Text("이메일")
            }
            .padding(.horizontal)
            .listStyle(PlainListStyle())
            
            Text("앱 기본설정")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .font(.headline)
            
            List {
                Text("언어")
                Text("날짜 형식")
                Text("주 시작일")
            }
            .padding(.horizontal)
            .listStyle(PlainListStyle())
            
            List {
                Button("로그아웃") {
                    _ = mgr.signOut()
                }
                .foregroundStyle(.red)
                Button("계정삭제") {
                    _ = mgr.deleteAccount(username: mgr.getUsername())
                }
                .foregroundStyle(.red)
            }
            .padding(.horizontal)
            .listStyle(PlainListStyle())
            
            Spacer()
        }
    }
}
