//
//  DatePickerCustomField.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 04/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import AsyncDisplayKit

class DatePickerCustomField: ASCellNode {
	
	let datePicker = ASDisplayNode { () -> UIView in
		let picker = UIDatePicker()
		picker.datePickerMode = UIDatePickerMode.date
		picker.backgroundColor = UIColor.white
		return picker
	}
	
	let headingNode: HeaderTextNode
	let currentDate: Date
	
	init(headerText: String, date: Date) {
		self.currentDate = date
		self.headingNode = HeaderTextNode(headerText: headerText)
		super.init()
		
		self.datePicker.style.preferredSize = CGSize(width: 375, height: 177)
		self.addSubnode(headingNode)
		self.addSubnode(datePicker)
	}
	
	override func didLoad() {
		super.didLoad()

		(datePicker.view as? UIDatePicker).flatMap {
			$0.date = self.currentDate
		}
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		let stack = ASStackLayoutSpec(direction: .vertical, spacing: 0.0, justifyContent: .center, alignItems: .stretch, children: [headingNode, datePicker])
		return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(9, 18, 9, 9), child: stack)
	}
}
