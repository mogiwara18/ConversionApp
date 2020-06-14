//
//  CustomTextfield.swift
//  ConversionApp
//
//  Created by 荻原美絵 on 2020/06/14.
//  Copyright © 2020 m.ogiwara. All rights reserved.
//

import SwiftUI

struct CustomTextfield: UIViewRepresentable {
    @Binding var text: String
    
    var keyType: UIKeyboardType
    var placeHolder: String
    var changeHandler:((String)->Void)?
    var isFirstResponder: Bool = false
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textfield = UITextField()
        textfield.keyboardType = keyType
        textfield.placeholder = placeHolder
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textfield.frame.size.width, height: 44))
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textfield.doneButtonTapped(button:)))
        toolBar.items = [doneButton]
        toolBar.setItems([doneButton], animated: true)
        textfield.inputAccessoryView = toolBar
        textfield.clearButtonMode = UITextField.ViewMode.always
        textfield.delegate = context.coordinator
        
        return textfield
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}

extension CustomTextfield {
    final class Coordinator: NSObject, UITextFieldDelegate {

        @Binding var text: String
        var didBecomeFirstResponder = false

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }

    }
}

extension  UITextField {
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
       self.resignFirstResponder()
    }
}
