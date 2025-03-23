//
//  ButtonsForContentSizeView.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 22.03.2025.
//

import SwiftUI

struct ButtonsForContentSizeView: View {

	@Environment(\.fontSizeCategory) private var fontSizeCategory

	var body: some View {
		VStack(alignment: .leading) {
			Text("Расположение кнопок")
				.font(.customFont(style: .headlineBold, isDynamic: true))

			viewForContentSize(fontSizeCategory > .normal ? .vertical : .horizontal)
		}
		.frame(maxWidth: .infinity, alignment: .topLeading)
	}

	private func viewForContentSize(_ axis: Axis.Set) -> some View {
		ViewThatFits(in: axis) {
			if axis == .horizontal {
				HStack(content: ButtonsView.init)
			} else {
				VStack(alignment: .center, content: ButtonsView.init)
					.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
			}
		}
	}
}

struct ButtonsView: View {

	@Environment(\.fontSizeCategory) private var fontSizeCategory

	var body: some View {
		Button {} label: {
			Image(systemName: "accessibility")
			Text("Кнопка")
				.font(.customFont(style: .bodyRegular, isDynamic: true))
		}
		.buttonStyle(.borderedProminent)

		Button {} label: {
			Image(systemName: "accessibility.fill")
			Text("Кнопка")
				.font(.customFont(style: .bodyRegular, isDynamic: true))
		}
		.buttonStyle(.bordered)

		Button {} label: {
			Image(systemName: "accessibility.badge.arrow.up.right")
			Text("Кнопка")
				.font(.customFont(style: .bodyRegular, isDynamic: true))
		}
		.buttonStyle(.bordered)
	}
}

#Preview {
	ButtonsForContentSizeView()
}
