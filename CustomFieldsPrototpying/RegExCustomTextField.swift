//
//  RegExCustomTextField.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 03/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import UIKit

class RegExCustomTextField: SingleLineTextNode, CustomTextField {
	
	let regex: NSRegularExpression
	
	init(regex: NSRegularExpression, heading: String, value: String) {
		self.regex = regex
		super.init(heading: heading, value: value)
	}
	
	func validate(text: String) -> Bool {
		if let _ = Float(text) {
			return true
		} else {
			return false
		}
	}
	
	func keyboardType() -> UIKeyboardType {
		return .decimalPad
	}
	
	override func textFieldDidChange(textField: UITextField) {
		_ = (textField.text).flatMap{ self.validate(text: $0) }
	}
	
	override func setupTextField(textField: UITextField) {
		textField.keyboardType = self.keyboardType()
	}
}
