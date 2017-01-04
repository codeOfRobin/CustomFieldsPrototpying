//
//  ViewController.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 02/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import UIKit
import AsyncDisplayKit

protocol validatable {
	var keyboardType: UIKeyboardType {get}
	func validate(text: String) -> Bool
}


class ViewController: UIViewController, ASTableDelegate, ASTableDataSource {

	let tableNode = ASTableNode()
	
	let customFields = ["~Text~", "~Multi-line text~", "Radio Buttons", "Dropdown list", "Checkboxes", "~Numerical Input~", "~Decimal Input~", "~Yes/No Toggle~", "Cascading Select", "~Date~", "~Regular Expressions~"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubnode(tableNode)
		tableNode.dataSource = self
		tableNode.delegate = self
	}
	
	func numberOfSections(in tableNode: ASTableNode) -> Int {
		return 1
	}
	
	func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		return customFields.count
	}
	
	func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
		switch indexPath.row {
		case 0:
			return SingleLineTextNode(heading: "Full Name", value: "Varun Shoor")
		case 1:
			return MultiLineTextNode(heading: "Description", value: "Sin=djhasfbjsdhafjsadhbfjsdafhbsajdhfbsjadhfbjshdhjbfdsbhjfsdabjhasdfbhjadsfjhjbhdfsabjhdsfbhjdsafbhjdsfahjbdsafhjsdfahjbhjbsdfhjdsfahjbj")
		case 6:
			return DecimalCustomTextField(heading: "Price", value: "21.0")
		case 7:
			return SwitchCustomField(heading: "Is it on right now?", state: true)
		case 9:
			return DatePickerCustomField(headerText: "Date", date: Date())
		default:
			return {
				let textNode = ASTextCellNode()
				textNode.text = customFields[indexPath.row]
				return textNode
				}()
		}
	}
	
	override func viewDidLayoutSubviews() {
		tableNode.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height - 300)
	}

}
