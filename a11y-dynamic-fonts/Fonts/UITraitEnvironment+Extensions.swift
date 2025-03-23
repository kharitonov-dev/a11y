//
//  UITraitEnvironment+Extensions.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 18.03.2025.
//

import UIKit

enum AccessibilityFontSizeCategory: Comparable {
	case small
	case normal
	case large
	case huge
	case extreme
	case unspecified
}

extension UITraitEnvironment {

	var fontSizeCategory: AccessibilityFontSizeCategory {
		switch traitCollection.preferredContentSizeCategory {
		case .extraSmall, .small, .medium:
			return .small
		case .large: // default apple font size category
			return .normal
		case .extraLarge, .extraExtraLarge, .extraExtraExtraLarge:
			return .large
		case .accessibilityMedium, .accessibilityLarge, .accessibilityExtraLarge:
			return .huge
		case .accessibilityExtraExtraLarge, .accessibilityExtraExtraExtraLarge:
			return .extreme
		default:
			return .unspecified
		}
	}
}
