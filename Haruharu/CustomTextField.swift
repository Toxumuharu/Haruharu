//
//  CustomTextField.swift
//  Haruharu
//
//  Created by Toxumuharu on 2021/02/23.
//
import SwiftUI

struct CustomTextField: UIViewRepresentable {
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        @Binding var currentlySelectedCell: Int
        var index: Int
        
        var didBecomeFirstResponder = false
        
        init(text: Binding<String>, currentlySelectedCell: Binding<Int>, index: Int) {
            _text = text
            _currentlySelectedCell = currentlySelectedCell
            self.index = index
        }
        
        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            didBecomeFirstResponder = false
            print("log: \(#function): index: \(index), currentlySelectedCell: \(self.currentlySelectedCell)")
            return true
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
            }
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            
            guard let stringRange = Range(range, in: currentText) else { return false }
            
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return (updatedText.count != 0) //<= 1
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.currentlySelectedCell = self.index // foreach index
            self.currentlySelectedCell += 1
            didBecomeFirstResponder = false
            
            print("log: \(#function): index: \(index), currentlySelectedCell: \(self.currentlySelectedCell)")
            return true
        }
    }
    
    @Binding var text: String
    @Binding var currentlySelectedCell: Int
    var isFirstResponder: Bool = false
    var index: Int
    
    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
//        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        return textField
    }
    
    func makeCoordinator() -> CustomTextField.Coordinator {
        return Coordinator(text: $text, currentlySelectedCell: $currentlySelectedCell, index: index)
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
        print("log: \(#function): isFirstResponder: \(isFirstResponder), !didBecomeFirstResponder: \(!context.coordinator.didBecomeFirstResponder)")
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}
