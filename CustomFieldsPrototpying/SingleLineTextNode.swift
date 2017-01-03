//
//  SingleLineTextNode.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 03/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import AsyncDisplayKit

class SingleLineTextNode: ASCellNode, UITextFieldDelegate {
	var textField = ASDisplayNode(viewBlock: { () -> UIView in
		let textFieldView = UITextField()
		textFieldView.placeholder = "-"
		textFieldView.text = "Varun Shoor"
		return textFieldView
	})
	let headingText = ASTextNode()
	
	let heading: String
	var value: String
	
	init(heading: String, value: String) {
		self.heading = heading
		self.value = value
		
		super.init()
		
		self.addSubnode(headingText)
		
		self.addSubnode(textField)
		textField.style.minHeight = ASDimensionMake(16)
		textField.style.minWidth = ASDimensionMake(100)
		self.layout()

		headingText.attributedText = NSAttributedString(string: heading, attributes: TextStyles.sharedStyles.timeStyle)
		
	}
	
	func textFieldDidChange(textField: UITextField) {}
	
	func setupTextField(textField: UITextField) {
		textField.keyboardType = .default
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		let inset = ASStackLayoutSpec(direction: .vertical, spacing: 9.0, justifyContent: .center, alignItems: .stretch, children: [headingText, textField])
		return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(9, 18, 9, 9), child: inset)
	}
	
	override func didLoad() {
		if let textFieldView = textField.view as? UITextField {
			textFieldView.addTarget(self, action: #selector(SingleLineTextNode.textFieldDidChange), for: .editingChanged)
			textFieldView.text = value
			setupTextField(textField: textFieldView)
		}
	}
}
