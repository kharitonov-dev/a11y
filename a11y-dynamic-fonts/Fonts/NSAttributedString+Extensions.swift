//
//  NSAttributedString+Extensions.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 23.02.2025.
//


import UIKit

extension NSAttributedString {
	
	/// Attribute text based on a custom style
	static func customAttributedString(_ string: String,
									   style: CustomFontStyle,
									   textAlignment: NSTextAlignment = .left,
									   lineBreakMode: NSLineBreakMode = .byTruncatingTail,
									   extraAttributes: [NSAttributedString.Key: Any]? = nil,
									   isDynamic: Bool? = nil) -> NSAttributedString {
		
		var attributes = style.fontAttributes(textAlignment: textAlignment,
											  lineBreakMode: lineBreakMode,
											  isDynamic: isDynamic)
		
		if let extraAttributes {
			attributes.merge(extraAttributes) { current, _ in current }
		}
		
		return NSAttributedString(string: string, attributes: attributes)
	}
}

