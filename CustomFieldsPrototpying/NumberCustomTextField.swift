//
//  NumberCustomTextField.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 03/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import UIKit

class NumberCustomTextField: SingleLineTextNode, CustomTextField {
	
	func validate(text: String) -> Bool {
		if let _ = Int(text) {
			return true
		} else {
			return false
		}
	}
	
	func keyboardType() -> UIKeyboardType {
		return .numberPad
	}
	
	override func textFieldDidChange(textField: UITextField) {
		_ = (textField.text).flatMap{ self.validate(text: $0) }
	}
	
	override func setupTextField(textField: UITextField) {
		textField.keyboardType = self.keyboardType()
	}
}
