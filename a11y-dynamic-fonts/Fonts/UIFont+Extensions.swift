//
//  UIFont+Extensions.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 23.02.2025.
//

import UIKit

extension UIFont {

    /// Custom font
    ///
    /// - Parameter style: The style of typography
    /// - Parameter isDynamic: Forced font scaling (bypassing the flag *isDynamicFontEnabled*)
    /// - Returns: UIFont
	static func customFont(style: CustomFontStyle, isDynamic: Bool? = nil) -> UIFont {
        let fontParams = style.parameters()
        let fontName = fontParams.fontName()
        let fontSize = fontParams.size
        let isDynamicFont = isDynamic ?? isDynamicFontEnabled
        
        guard let font = UIFont(name: fontName, size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        
		return isDynamicFont ? scaledFont(for: font, params: fontParams) : font
    }
    
    /// Font scaling
    private static func scaledFont(for font: UIFont, params: CustomFontStyle.Parameters) -> UIFont {
		let metrics = UIFontMetrics(forTextStyle: params.appleTextStyle)
		let scaledFont = metrics.scaledFont(for: font, maximumPointSize: params.maxSize)

        return scaledFont
    }
}
