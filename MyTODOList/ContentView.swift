import SwiftUI

struct ContentView: View {
    @State var textInput: String = ""
    @State var todoStorage = TodoStorage()
    @State var username: String = "Hello"
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("2024년 8월")
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                    
                    NavigationLink(destination: {
                        PreferenceView(username: $username)
                    }) {
                        Circle()
                            .fill(.gray)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                }
                
                HStack {
                    TextField("할 일을 입력해 주세요", text: $textInput)
                        .padding()
                    Button("저장") {
                        if textInput.count != 0 {
                            todoStorage.insert(textInput)
                            textInput = ""
                        }
                    }
                    .padding()
                }
                
                Text("할 일 목록")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ForEach(todoStorage.todoList, id: \.self) { todo in
                    HStack {
                        Text(todo.content)
                        Spacer()
                        Button(todo.done ? "완료" : "미완료") {
                            todo.done.toggle()
                            todoStorage.updateDoneField(id: todo.id, done: todo.done)
                        }
                        Button("삭제") {
                            todoStorage.delete(id: todo.id)
                        }
                    }
                    .padding()
                }
                
                
                Text("완료된 목록")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                ForEach(todoStorage.todoList, id: \.self) { todo in
                    if todo.done {
                        HStack {
                            Text(todo.content)
                                .padding()
                            Spacer()
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
