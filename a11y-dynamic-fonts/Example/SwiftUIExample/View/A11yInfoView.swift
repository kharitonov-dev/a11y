//
//  A11yInfoView.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 22.03.2025.
//

import SwiftUI

struct A11yInfoView: View {

	@Environment(\.fontSizeCategory) private var fontSizeCategory

	var body: some View {
		VStack(alignment: .center) {
			Text("Размер категории шрифта: \(fontSizeCategory)")
				.font(.customFont(style: .bodyRegular, isDynamic: false))
				.padding(.horizontal, 20)
			Text("Примеры динамической верстки")
				.font(.customFont(style: .bodyRegular, isDynamic: false))
				.padding(.horizontal, 20)
		}
	}
}

#Preview {
	A11yInfoView()
}
