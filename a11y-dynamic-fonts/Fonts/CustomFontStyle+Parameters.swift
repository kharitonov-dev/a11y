//
//  CustomFontStyle+Parameters.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 23.02.2025.
//

import UIKit
import SwiftUI

extension CustomFontStyle {

	struct Parameters {

		enum Weight: String {
			case black = "Black"
			case bold = "Bold"
			case medium = "Medium"
			case regular = "Regular"
			case light = "Light"
		}

		// MARK: - Font parameters

		let size: CGFloat
		let maxSize: CGFloat // for a11y
		let lineHeight: CGFloat
		let maxLineHeight: CGFloat // for a11y
		let weight: Weight
		let appleTextStyle: UIFont.TextStyle // for a11y
		let appleTextStyleSUI: Font.TextStyle // for a11y

		private(set) var paragraphSpacing: CGFloat = 0
		private(set) var kernValue: CGFloat? = nil
		private(set) var baselineOffset: CGFloat = 0

		// MARK: - Functions

		func fontName() -> String {
			return "Roboto-" + weight.rawValue
		}
	}
}
