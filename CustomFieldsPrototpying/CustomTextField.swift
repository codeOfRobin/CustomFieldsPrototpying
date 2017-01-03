//
//  CustomTextField.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 03/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import UIKit

protocol CustomTextField {
	func validate(text: String) -> Bool
	func keyboardType() -> UIKeyboardType
}

extension CustomTextField {
	
	func validate(text: String) -> Bool {
		return true
	}
	
	func keyboardType() -> UIKeyboardType {
		return .default
	}

}
