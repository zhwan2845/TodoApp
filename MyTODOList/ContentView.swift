import SwiftUI

struct ContentView: View {
    @State var textInput: String = ""
    @State var todoStorage = TodoStorage()
    
    var body: some View {
        VStack {
            HStack {
                Text("2024년 8월")
                    .font(.largeTitle)
                    .padding()
                Spacer()
                Circle()
                    .fill(.gray)
                    .frame(width: 50, height: 50)
                    .padding()
            }
            
            HStack {
                TextField("할 일을 입력해 주세요", text: $textInput)
                    .padding()
                Button("저장") {
                    print(textInput)
                    if textInput.count != 0 {
                        todoStorage.insert(textInput)
                        print(todoStorage.todoList)
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
                    Button("미완료") {
                        todo.done.toggle()
                        todoStorage.updateDoneField(id: todo.id, done: todo.done)
                    }
                }
            }
            
            
            Text("완료된 목록")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
//                ForEach(todoList, id: \.self) { todo in
//                    if todo.isCompleted == true {
//                        Text(todo.content)
//                            .padding()
//                    }
//                }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
