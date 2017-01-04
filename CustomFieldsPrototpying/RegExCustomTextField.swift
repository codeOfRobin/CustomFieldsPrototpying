//
//  RegExCustomTextField.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 03/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import UIKit

class RegExCustomTextField: SingleLineTextNode, CustomTextField {
	
	let regexPattern: String
	
	init(regexPattern: String, heading: String, value: String) {
		self.regexPattern = regexPattern
		super.init(heading: heading, value: value)
	}
	
	func validate(text: String) -> Bool {
		if let _ = text.range(of: regexPattern, options: .regularExpression, range: Range<String.Index>(uncheckedBounds: (lower: text.startIndex, upper: text.endIndex)), locale: Locale.current) {
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
