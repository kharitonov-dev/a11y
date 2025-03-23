//
//  UIStackView+Extension.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 27.02.2025.
//

import UIKit

extension UIStackView {

	func addArrangedSubviews(_ views: [UIView]) {
		for view in views {
			addArrangedSubview(view)
		}
	}
}
