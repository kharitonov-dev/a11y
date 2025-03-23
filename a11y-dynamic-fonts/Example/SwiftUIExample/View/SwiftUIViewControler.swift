//
//  SwiftUIViewControler.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 26.02.2025.
//

import SwiftUI

class SwiftUIViewControler: UIHostingController<ExampleSUIView> {

	override init(rootView: ExampleSUIView) {
		super.init(rootView: rootView)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "SwiftUI Screen"
		view.backgroundColor = .systemPink
	}
}
