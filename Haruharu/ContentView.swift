//
//  ContentView.swift
//  Haruharu
//
//  Created by Toxumuharu on 2021/02/09.
//

import SwiftUI

struct ContentView: View {

//    @State private var editting = false
    @State private var arr = [String]()
    @State var new = ""
    @State private var numberOfCells: Int = 3
    @State private var currentlySelectedCell = 0
    
    var body: some View {
        VStack{
            Spacer()
            CalendarView()
                .frame(maxHeight: UIScreen.screenHeight * 0.4)
//                .border(Color.red, width: 2)
//            Spacer()

            List {
                ForEach(arr.indices, id: \.self) { i in
                    HStack{
                        CheckView()
                        TextField("", text: $arr[i], onEditingChanged: { (changed) in
                            print("onEditingChanged")
                        }) {
                            for item in arr {
                                print(item)
                            }
                        }
                    }
                }

                HStack{
                    CheckView()
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
            }
            
//            List{
//                //https://www.hackingwithswift.com/forums/100-days-of-swiftui/jump-focus-between-a-series-of-textfields-pin-code-style-entry-widget/765
//                ForEach(0 ..< self.numberOfCells) { index in
//                    CharacterInputCell(currentlySelectedCell: self.$currentlySelectedCell, index: index)
//                        .frame(maxHeight: UIScreen.screenHeight * 0.08)
//                }
//            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
