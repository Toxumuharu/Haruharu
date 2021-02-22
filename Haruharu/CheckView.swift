//
//  CheckView.swift
//  Haruharu
//
//  Created by Toxumuharu on 2021/02/13.
//

import SwiftUI

struct CheckView: View {
    @State var isChecked:Bool = false
    var title:String
    func toggle(){isChecked = !isChecked}
    var body: some View {
        Button(action: toggle){
            HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
                    .foregroundColor(.blue)
                Text(title)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        CheckView(title:"check box")
    }
}
