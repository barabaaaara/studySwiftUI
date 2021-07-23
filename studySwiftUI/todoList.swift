//
//  todoList.swift
//  studySwiftUI
//
//  Created by 桑原佑輔 on 2021/07/23.
//

import SwiftUI

struct todoList: View {
    @State var newItem : String = ""
    @State var toDOList : [String] = ["買い物","選択"]
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
                    self.toDOList.append(self.newItem)
                    self.newItem = ""
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
            List(toDOList, id:\.self) { item in
                Text(item)
            }
            Spacer()
        }
    }
    
    struct todoList_Previews: PreviewProvider {
        static var previews: some View {
            todoList()
        }
    }
}
