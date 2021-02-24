//
//  CharacterInputCell.swift
//  Haruharu
//
//  Created by Toxumuharu on 2021/02/23.
//

import SwiftUI

struct CharacterInputCell: View {
    @State private var textValue: String = ""
    @Binding var currentlySelectedCell: Int

    var index: Int

    var responder: Bool {
        return index == currentlySelectedCell
    }

    var body: some View {
        CustomTextField(text: $textValue, currentlySelectedCell: $currentlySelectedCell, isFirstResponder: responder, index: index)
    }
}
