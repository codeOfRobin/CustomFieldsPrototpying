//
//  RegexOperator.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 04/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import Foundation

func match(string: String, with pattern: String) -> Bool {
	return Regex(pattern: pattern).test(input: string)
}

class Regex {
	let internalExpression: NSRegularExpression
	let pattern: String
	
	init(pattern: String) {
		self.pattern = pattern
		do {
			try self.internalExpression = NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
		} catch {
			self.internalExpression = NSRegularExpression()
		}
	}
	
	func test(input: String) -> Bool {
		let matches = self.internalExpression.matches(in: input, options: [], range:NSMakeRange(0, input.characters.count))
		return matches.count > 0
	}
}
