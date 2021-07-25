//
//  todoList.swift
//  studySwiftUI
//
//  Created by 桑原佑輔 on 2021/07/23.
//

import SwiftUI

struct todoList: View {
    @State var newItem : String = ""
    @State var toDoList : [String] = ["買い物","選択"]
    var body: some View {
        VStack {
            HStack {
                Text("新しい予定の追加")
                    .font(.largeTitle)
                    .padding(.leading)
                Spacer()
            }
            
            HStack {
                TextField("新しい予定を入力してください", text: $newItem).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:300)
                
                Button(action: {
                    self.toDoList.append(self.newItem)
                    self.newItem = ""
                    UserDefaults.standard.set(self.toDoList, forKey: "ToDoList")
                }){
                    ZStack{
                        RoundedRectangle(cornerRadius:5)
                            .frame(width: 50 ,height :30)
                            .foregroundColor(.green)
                        Text("追加")
                            .foregroundColor(.white)
                        
                    }
                }
            }
            HStack {
                Text("TODO LIST")
                    .font(.largeTitle)
                    .padding(.leading)
                Spacer()
            }
            List{
                ForEach(toDoList, id:\.self) { item in
                    Text(item)
                }.onDelete{ (IndexSet) in
                self.toDoList.remove(atOffsets: IndexSet)
                }
            }
            Spacer()
        }.onAppear(){
            guard let defaultItem = UserDefaults.standard.array(forKey: "ToDoList") as?[String]
            else{return}
            self.toDoList = defaultItem
        }
    }
    
    struct todoList_Previews: PreviewProvider {
        static var previews: some View {
            todoList()
        }
    }
}

