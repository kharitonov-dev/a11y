//
//  ExamplePresenter.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 26.02.2025.
//

import UIKit

protocol ExamplePresenterProtocol {
	var sectionsForExample: [SectionModel] { get }
	var isActiveA11yGlobalFlag: Bool { get }
	var activeA11yLocalFlag: [Int: Bool] { get }

	func a11yGlobalFlag(set: Bool)
	func a11yLocalFlag(for indexCell: Int, isActive: Bool)
}

class ExamplePresenter: ExamplePresenterProtocol {

	var sectionsForExample: [SectionModel] = [
		SectionModel(
			sectionHeader: "Large title",
			models: [
				FontExampleModel(
					title: "largeTitleBlack",
					style: .largeTitleBlack
				),
				FontExampleModel(
					title: "largeTitleBold",
					style: .largeTitleBold
				),
				FontExampleModel(
					title: "largeTitleMedium",
					style: .largeTitleMedium
				)
			]
		),
		SectionModel(
			sectionHeader: "Title",
			models: [
				FontExampleModel(
					title: "titleBlack",
					style: .titleBlack
				),
				FontExampleModel(
					title: "titleBold",
					style: .titleBold
				),
				FontExampleModel(
					title: "titleMedium",
					style: .titleMedium
				)
			]
		),
		SectionModel(
			sectionHeader: "Headline",
			models: [
				FontExampleModel(
					title: "headlineBold",
					style: .headlineBold
				),
				FontExampleModel(
					title: "headlineMedium",
					style: .headlineMedium
				),
				FontExampleModel(
					title: "headlineRegular",
					style: .headlineRegular
				)
			]
		),
		SectionModel(
			sectionHeader: "Body",
			models: [
				FontExampleModel(
					title: "bodyMedium",
					style: .bodyMedium
				),
				FontExampleModel(
					title: "bodyRegular",
					style: .bodyRegular
				),
				FontExampleModel(
					title: "bodyLight",
					style: .bodyLight
				)
			]
		),
		SectionModel(
			sectionHeader: "Footnote",
			models: [
				FontExampleModel(
					title: "footnoteRegular",
					style: .footnote
				)
			]
		),
		SectionModel(
			sectionHeader: "Caption",
			models: [
				FontExampleModel(
					title: "captionLight",
					style: .caption
				)
			]
		)
	]
	var isActiveA11yGlobalFlag: Bool = UIFont.isDynamicFontEnabled
	var activeA11yLocalFlag: [Int: Bool] = [:]

	func a11yGlobalFlag(set: Bool) {
		UIFont.isDynamicFontEnabled = set
	}

	func a11yLocalFlag(for indexCell: Int, isActive: Bool) {
		activeA11yLocalFlag[indexCell] = isActive
	}
}
