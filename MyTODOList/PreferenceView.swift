import SwiftUI

struct PreferenceView: View {
    var body: some View {
        VStack {
            Text("haeun")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .font(.largeTitle)
                .bold()
            
            Text("계정")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .font(.headline)
            
            List {
                Text("이름")
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
                Text("로그아웃")
                    .foregroundStyle(.red)
                Text("계정삭제")
                    .foregroundStyle(.red)
            }
            .padding(.horizontal)
            .listStyle(PlainListStyle())
            
            Spacer()
        }
    }
}

#Preview {
    PreferenceView()
}
