//
//  ContentView.swift
//  studySwiftUI
//
//  Created by 桑原佑輔 on 2021/07/22.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = "Hello, world!"
    @State var newItem: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            TextField("New Item", text: $newItem, onCommit:{//初期値が”New Item”でvar newItemと紐付いているテキストフィールド。編集後に反映される。
                self.text = self.newItem //編集完了後に変数textに変数newItemを代入
                self.newItem = ""//変数newItemを空にする
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())//外枠のついたテキストフィールド
            .frame(width: 300)//外枠の長さ
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
