//
//  MultiLineTextNode.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 03/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import AsyncDisplayKit

class MultiLineTextNode: ASCellNode, ASEditableTextNodeDelegate {
	
	let headingText = ASTextNode()
	let textField = ASEditableTextNode()

	
	let heading: String
	let value: String
	
	init(heading: String, value: String) {
		self.heading = heading
		self.value = value
		
		super.init()
		
		self.addSubnode(headingText)
		self.addSubnode(textField)
		
		headingText.attributedText = NSAttributedString(string: heading, attributes: TextStyles.sharedStyles.timeStyle)
		textField.attributedText = NSAttributedString(string: value, attributes: TextStyles.sharedStyles.bodyStyle)
		textField.style.minHeight = ASDimensionMake(50)
		textField.delegate = self
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		let stack = ASStackLayoutSpec(direction: .vertical, spacing: 9.0, justifyContent: .center, alignItems: .stretch, children: [headingText, textField])
		return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(9, 18, 9, 9), child: stack)
	}
	
	func editableTextNodeDidUpdateText(_ editableTextNode: ASEditableTextNode) {
		print(editableTextNode.textView.contentSize)
	}
}
