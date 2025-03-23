//
//  UIView+Extension.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 27.02.2025.
//

import UIKit

extension UIView {

	func addSubviews(_ views: [UIView]) {
		for view in views {
			addSubview(view)
		}
	}
}
