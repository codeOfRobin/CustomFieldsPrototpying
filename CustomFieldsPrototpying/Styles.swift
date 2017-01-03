//
//  Styles.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 03/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import UIKit

let primaryActionColor = UIColor(red:0.31, green:0.69, blue:0.80, alpha:1.00)
let grayTextColor = UIColor(red:0.18, green:0.19, blue:0.22, alpha:1.00)
let lightGrayTextColor = UIColor(red:0.63, green:0.67, blue:0.69, alpha:1.00)
let defaultFont = UIFont.systemFontSize

let darkSeparatorColor = UIColor(red:0.82, green:0.84, blue:0.84, alpha:1.00)
let lightSeparatorColor = UIColor(red:0.92, green:0.93, blue:0.94, alpha:1.00)

let actionRedColor = UIColor(red:0.95, green:0.44, blue:0.25, alpha:1.00)
let actionYellowColor = UIColor(red:0.97, green:0.79, blue:0.38, alpha:1.00)
let actionGreenColor = UIColor(red:0.21, green:0.63, blue:0.28, alpha:1.00)

let darkText = UIColor(red:0.18, green:0.19, blue:0.22, alpha:1.00)
let lightText = UIColor(red:0.51, green:0.55, blue:0.58, alpha:1.00)


struct TextStyles {
	let nameStyle: [String: Any] = [
		NSFontAttributeName: UIFont.systemFont(ofSize: 16, weight: UIFontWeightSemibold),
		NSForegroundColorAttributeName: darkText
	]
	
	let timeStyle: [String: Any] = [
		NSFontAttributeName: UIFont.systemFont(ofSize: 13, weight: UIFontWeightRegular),
		NSForegroundColorAttributeName: lightText
	]
	
	let lightTimeStyle: [String: Any] = [
		NSFontAttributeName: UIFont.systemFont(ofSize: 13, weight: UIFontWeightRegular),
		NSForegroundColorAttributeName: lightText.withAlphaComponent(0.8)
	]
	
	let bodyStyle: [String: Any] = [
		NSFontAttributeName: UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular),
		NSForegroundColorAttributeName: darkText
	]
	
	let subjectStyle: [String: Any] = [
		NSFontAttributeName: UIFont.systemFont(ofSize: 22, weight: UIFontWeightLight),
		NSForegroundColorAttributeName: darkText
	]
	
	let linkStyle: [String: Any] = [
		NSFontAttributeName: UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular),
		NSForegroundColorAttributeName: primaryActionColor
	]
	
	static let sharedStyles = TextStyles()
}
