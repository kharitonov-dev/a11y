//
//  Font+Extensions.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 26.02.2025.
//

import SwiftUI

extension Font {

	static func customFont(style: CustomFontStyle, isDynamic: Bool? = nil) -> Font {
		return Font(UIFont.customFont(style: style, isDynamic: isDynamic))
	}
}
