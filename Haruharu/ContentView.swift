//
//  ContentView.swift
//  Haruharu
//
//  Created by Toxumuharu on 2021/02/09.
//

import SwiftUI

struct ContentView: View {
    @State private var userLearn = ""
    @State private var message = ""
    @State private var editting = false
    @State private var arr = ["1","2","3"]
    
    
    var body: some View {
        
        VStack{
            ScrollView {
                CalendarView()
                    .border(Color.red, width: 2)
                
                    
                TextField("Enter what you learn today", text: $userLearn, onEditingChanged: { (changed) in
                    print("Username onEditingChanged - \(changed)")
                }) {
                    print("Username onCommit")
                }
                
                ForEach(self.arr.indices, id:\.self) {
                    TextField("", text: self.$arr[$0])
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(2)
                }
            }
            .padding(.leading, 5)
            .padding(3)
        }.padding()
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//extension NSTextField {
//    open override var focusRingType: NSFocusRingType {
//        get { .none }
//        set { }
//    }
//}
