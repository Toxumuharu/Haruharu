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
    @State private var arr = [String]()
    @State var new = ""
    
    var body: some View {
        //        ScrollView {
        VStack{
            CalendarView()
                .frame(
                    maxWidth: UIScreen.screenWidth * 0.6
                )
            //                .border(Color.red, width: 2)

            List {
                ForEach(arr.indices, id: \.self) { i in
                    TextField("", text: $arr[i], onEditingChanged: { (changed) in
                        print("onEditingChanged")
                    }) {
                        for item in arr {
                            print(item)
                        }
                    }
                    .textFieldStyle(PlainTextFieldStyle())
                }
                
                TextField("Input here", text: $new, onEditingChanged: { (changed) in
                    print("Username onEditingChanged - \(changed)")
                }) {
                    print("Username onCommit")
                    arr.append(new)
                    new = ""

                    for item in arr {
                        print(item)
                    }
                }
            }
            Spacer()
            
        }
        .padding()
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
