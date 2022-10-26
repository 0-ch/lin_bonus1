//
//  ContentView.swift
//  lin_bonus1
//
//  Created by User01 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    @State var foodName = ""
    @State var foods : [String] = []
    @State private var showAlert = false
    @State private var alertTitle = ""
    var body: some View {
        VStack{
            Text("到底要吃什麼...").font(.title)
            HStack{
                TextField(" 輸入食物", text: $foodName)
                Button("OK", action: {
                    foods.append(foodName)
                    foodName = ""
                })
            }.offset(y:10)
            List{
                ForEach(foods,id:\.self){
                    food in
                    Text("\(food)").background(Color.blue)
                }
            }
            Button {
                showAlert = true
            } label: {
                Text("選！")
            }
            .alert(isPresented: $showAlert, content: {
                let answer = foods.randomElement()
                if let answer = answer{
                    return Alert(title: Text("要吃\(answer)！"))
                }
                return Alert(title: Text("沒有選項"))
            })
            Text(" ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
