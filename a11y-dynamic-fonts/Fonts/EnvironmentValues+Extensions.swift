//
//  EnvironmentValues+Extensions.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 21.03.2025.
//

import SwiftUI

extension EnvironmentValues {

	var fontSizeCategory: AccessibilityFontSizeCategory {
		switch dynamicTypeSize {
		case .xSmall, .small, .medium:
			return .small
		case .large: // default apple font size category
			return .normal
		case .xLarge, .xxLarge, .xxxLarge:
			return .large
		case .accessibility1, .accessibility2, .accessibility3:
			return .huge
		case .accessibility4, .accessibility5:
			return .extreme
		default:
			return .unspecified
		}
	}
}
