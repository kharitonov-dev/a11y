//
//  UIFont+Registration.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 24.02.2025.
//

import UIKit

extension UIFont {
	
	/// Dynamic font scaling global flag for the application
	static var isDynamicFontEnabled: Bool = false

	/// Registration custom fonts
	/// - Parameter isDynamic: Font scaling for the application
	static func registerFonts(isDynamic: Bool? = nil) {
		if let isDynamic {
			isDynamicFontEnabled = isDynamic

			UILabel.appearance().adjustsFontForContentSizeCategory = true
			UITextView.appearance().adjustsFontForContentSizeCategory = true
			UITextField.appearance().adjustsFontForContentSizeCategory = true
			UIButton.appearance().adjustsImageSizeForAccessibilityContentSizeCategory = true
		}

		FontsLoader.registerFonts
	}
}
