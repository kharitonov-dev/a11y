//
//  SUIViewExample.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 26.02.2025.
//

import SwiftUI

struct ExampleView: View {

	@Environment(\.fontSizeCategory) private var fontSizeCategory

	var body: some View {
		Text("Размер категории шрифта: \(fontSizeCategory)")
			.foregroundStyle( fontSizeCategory > .normal ? .red : .white)
	}
}

struct ExampleSUIView: View {

	@Environment(\.fontSizeCategory) private var fontSizeCategory
	@ObservedObject private var viewModel: ExampleSUIViewModel

	init(viewModel: ExampleSUIViewModel) {
		self.viewModel = viewModel
	}

	var body: some View {
		ScrollView {
			VStack {
				A11yInfoView()

				ProfileView()
					.padding(.top, 20)

				ButtonsForContentSizeView()
					.padding(.top, 20)
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
		}
		.padding(.horizontal, 20)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.onChange(of: fontSizeCategory) { oldValue, newValue in
			print("⚠️ fontSizeCategory old value \(oldValue) and NEW VALUE \(newValue)")
		}
		.foregroundStyle(.white)
		.background(.pink)
	}
}

#if DEBUG
#Preview {
	let viewModel = ExampleSUIViewModel()
	ExampleSUIView(viewModel: viewModel)
}
#endif
