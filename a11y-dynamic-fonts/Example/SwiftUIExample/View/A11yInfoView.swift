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
            HStack {
                Text("Размер категории шрифта:")
                    .font(.customFont(style: .bodyRegular, isDynamic: false))
                Text(".\(fontSizeCategory)")
                    .font(.customFont(style: .bodyMedium, isDynamic: false))
            }
			Text("Примеры динамической верстки")
				.font(.customFont(style: .bodyRegular, isDynamic: false))
		}
	}
}

#Preview {
	A11yInfoView()
}
