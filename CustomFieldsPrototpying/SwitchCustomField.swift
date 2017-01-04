//
//  SwitchCustomField.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 04/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import AsyncDisplayKit

class SwitchCustomField: ASCellNode {
	
	let switchControl = ASDisplayNode { () -> UIView in
		let switchy = UISwitch()
		switchy.backgroundColor = UIColor.white
		return switchy
	}
	
	let headingNode = ASTextNode()
	var state: Bool
	
	init(heading: String, state: Bool) {
		self.state = state
		super.init()
		
		switchControl.style.preferredSize = CGSize(width: 51, height: 36)
		self.addSubnode(headingNode)
		self.addSubnode(switchControl)
		headingNode.attributedText = NSAttributedString(string: heading, attributes: TextStyles.sharedStyles.bodyStyle)
	}
	
	override func didLoad() {
		(switchControl.view as? UISwitch)?.isOn = self.state
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		let stack = ASStackLayoutSpec(direction: .horizontal, spacing: 0.0, justifyContent: .spaceBetween, alignItems: .center, children: [headingNode, switchControl])
		return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(9, 18, 9, 9), child: stack)
	}
	
}
