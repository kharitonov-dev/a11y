//
//  CustomFontStyle.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 23.02.2025.
//

import UIKit
import SwiftUI

enum CustomFontStyle {

	case largeTitleBlack
	case largeTitleBold
	case largeTitleMedium

	case titleBlack
	case titleBold
	case titleMedium

	case headlineBold
	case headlineMedium
	case headlineRegular

	case bodyMedium
	case bodyRegular
	case bodyLight

	case footnote
	case caption

	func parameters() -> Parameters {
		switch self {
		case .largeTitleBlack:
			return Parameters(size: 44,
							  maxSize: 50,
							  lineHeight: 44,
							  maxLineHeight: 44,
							  weight: .black,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: -7.5)
		case .largeTitleBold:
			return Parameters(size: 44,
							  maxSize: 50,
							  lineHeight: 44,
							  maxLineHeight: 44,
							  weight: .bold,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: -7.5)
		case .largeTitleMedium:
			return Parameters(size: 44,
							  maxSize: 50,
							  lineHeight: 44,
							  maxLineHeight: 44,
							  weight: .medium,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: -7.5)
		case .titleBlack:
			return Parameters(size: 36,
							  maxSize: 42,
							  lineHeight: 40,
							  maxLineHeight: 42,
							  weight: .black,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: -1.5)
		case .titleBold:
			return Parameters(size: 36,
							  maxSize: 42,
							  lineHeight: 40,
							  maxLineHeight: 42,
							  weight: .bold,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: -1.5)
		case .titleMedium:
			return Parameters(size: 36,
							  maxSize: 42,
							  lineHeight: 40,
							  maxLineHeight: 42,
							  weight: .medium,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: -1.5)
		case .headlineBold:
			return Parameters(size: 24,
							  maxSize: 30,
							  lineHeight: 32,
							  maxLineHeight: 32,
							  weight: .bold,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: 1)
		case .headlineMedium:
			return Parameters(size: 24,
							  maxSize: 30,
							  lineHeight: 32,
							  maxLineHeight: 32,
							  weight: .medium,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: 1)
		case .headlineRegular:
			return Parameters(size: 24,
							  maxSize: 30,
							  lineHeight: 32,
							  maxLineHeight: 32,
							  weight: .regular,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: 1)
		case .bodyMedium:
			return Parameters(size: 14,
							  maxSize: 18,
							  lineHeight: 20,
							  maxLineHeight: 20,
							  weight: .medium,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: 1)
		case .bodyRegular:
			return Parameters(size: 14,
							  maxSize: 18,
							  lineHeight: 20,
							  maxLineHeight: 20,
							  weight: .regular,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: 1)
		case .bodyLight:
			return Parameters(size: 14,
							  maxSize: 18,
							  lineHeight: 20,
							  maxLineHeight: 20,
							  weight: .light,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: 1)
		case .footnote:
			return Parameters(size: 12,
							  maxSize: 18,
							  lineHeight: 16,
							  maxLineHeight: 20,
							  weight: .regular,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: 0.3)
		case .caption:
			return Parameters(size: 12,
							  maxSize: 18,
							  lineHeight: 16,
							  maxLineHeight: 20,
							  weight: .light,
							  appleTextStyle: systemTextStyle,
							  appleTextStyleSUI: systemTextStyleSUI,
							  baselineOffset: 1)
		}
	}

	/// Text String Style Attributes
	func fontAttributes(textAlignment: NSTextAlignment = .left,
						lineBreakMode: NSLineBreakMode = .byTruncatingTail,
						isDynamic: Bool? = nil) -> [NSAttributedString.Key: Any] {
		let params = parameters()
		let isDynamicFont = isDynamic ?? UIFont.isDynamicFontEnabled
        let font = UIFont.customFont(style: self, isDynamic: isDynamic)
        let baseLineHeightMultiple: CGFloat = 1.2
        
        let lineHeight = FontMetricsCalculator.dynamicLineHeight(
            for: font,
            style: self.systemTextStyle,
            baseLineHeightMultiple: 1.2
        )

		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.minimumLineHeight = lineHeight
		paragraphStyle.maximumLineHeight = lineHeight

		paragraphStyle.paragraphSpacing = params.paragraphSpacing

		paragraphStyle.lineBreakMode = lineBreakMode
		paragraphStyle.alignment = textAlignment

		var attrs: [NSAttributedString.Key: Any] = [
			.baselineOffset: params.baselineOffset,
			.paragraphStyle: paragraphStyle,
			.font: UIFont.customFont(style: self, isDynamic: isDynamic)
		]

		if let kernValue = params.kernValue {
			attrs[.kern] = kernValue
		}

		return attrs
	}
}

struct FontMetricsCalculator {
    private static var cache = [String: CGFloat]()
    
    static func dynamicLineHeight(for font: UIFont,
                                style: UIFont.TextStyle,
                                baseLineHeightMultiple: CGFloat = 1.2) -> CGFloat {
        let cacheKey = "\(font.fontName)-\(font.pointSize)-\(style.rawValue)"
        
        if let cached = cache[cacheKey] {
            return cached
        }
        
        // Рассчитываем коэффициент коррекции на основе размера
        let baseSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style).pointSize
        let sizeRatio = font.pointSize / baseSize
        
        // Нелинейная функция коррекции
        let adjustment: CGFloat
        if sizeRatio < 1.0 {
            adjustment = 0.0
        } else {
            adjustment = 0.15 * log2(sizeRatio)
        }
        
        // Учитываем собственный межстрочный интервал шрифта
        let fontInherentSpacing = font.ascender - font.descender - font.pointSize
        let fontSpacingFactor = fontInherentSpacing / font.pointSize
        
        // Финальный расчет
        let effectiveMultiple = baseLineHeightMultiple - adjustment + fontSpacingFactor
        let lineHeight = font.pointSize * effectiveMultiple
        
        cache[cacheKey] = lineHeight
        return lineHeight
    }
}

extension CustomFontStyle {

	/// Comparing custom styles with Apple's default ones
	var systemTextStyle: UIFont.TextStyle {
		switch self {
		case .largeTitleBlack, .largeTitleBold, .largeTitleMedium:
			return .largeTitle
		case .titleBlack, .titleBold, .titleMedium:
			return .title1
		case .headlineBold, .headlineMedium, .headlineRegular:
			return .headline
		case .bodyMedium, .bodyRegular, .bodyLight:
			return .body
		case .footnote:
			return .footnote
		case .caption:
			return .caption1
		}
	}

	var systemTextStyleSUI: Font.TextStyle {
		switch self {
		case .largeTitleBlack, .largeTitleBold, .largeTitleMedium:
			return .largeTitle
		case .titleBlack, .titleBold, .titleMedium:
			return .title
		case .headlineBold, .headlineMedium, .headlineRegular:
			return .headline
		case .bodyMedium, .bodyRegular, .bodyLight:
			return .body
		case .footnote:
			return .footnote
		case .caption:
			return .caption
		}
	}
}
