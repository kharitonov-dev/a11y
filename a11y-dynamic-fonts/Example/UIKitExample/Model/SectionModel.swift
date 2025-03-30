//
//  SectionModel.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 23.02.2025.
//

import UIKit

struct SectionModel {
    let sectionHeader: String?
    var models: [FontExampleModel]
}

struct FontExampleModel {
	let title: String
	let style: CustomFontStyle
	let example: String = "Hi! I hope this material will be useful."
    var isDynamicFontExampleText: Bool?
}
